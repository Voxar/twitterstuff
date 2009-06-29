require 'twitter'
class SpamController < ApplicationController
  rescue_from Twitter::Unauthorized, :with => :twitter_unauthorized
  def index

  end
  
  def block
    begin
      id = params[:id]
      client.block(id)
      render :text=>'User has been blocked. The block might take a while to go through'
    rescue Exception=>e
      render :text=>e.to_s
    end
  end
  
  def follow
    begin
      id = params[:id]
      client.friendship_create(id, true)
      render :text=>'You are now following this user'
    rescue Exception=>e
      render :text=>e.to_s
    end
  end
  
  def filter
    @followers = followers.reject{|f| f.following }
  end
  
  def authorize
    session['rtoken'] = oauth.request_token.token
    session['rsecret'] = oauth.request_token.secret
    redirect_to oauth.request_token.authorize_url
  end
  
  def auth_response
    oauth.authorize_from_request(session['rtoken'], session['rsecret'])
    
    session['atoken'] = oauth.access_token.token
    session['asecret'] = oauth.access_token.secret
    redirect_to :action=>'filter'
  end
  
  private
  def twitter_unauthorized(exception)
    redirect_to :action=>'authorize'
  end    
  
  def oauth
    @oauth ||= Twitter::OAuth.new(TwitterOAuth['token'], TwitterOAuth['secret'])
  end
  
  def client
    @client ||= begin
      oauth.authorize_from_access(session['atoken'], session['asecret'])
      Twitter::Base.new(oauth)
    end
  end
  
  def followers
    users = client.followers
    users.each do |follower| 
      followers = follower.followers_count
      following = follower.friends_count
      if following > 0
        follower.rating = followers.to_f/following.to_f
      else
        follower.rating = 0
      end
      
      #users with less than 50 follows is probably not bots
      follower.rating += 0.11 if following < 50
    end
    users.sort do |a,b|
      a.rating - b.rating
    end
  end
  
end
