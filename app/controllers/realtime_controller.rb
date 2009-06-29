class RealtimeController < ApplicationController
  
  def index
    @tweets = Tweet.find(:all)
  end
  
  def more
    since = params[:id] || 0
    tweets = Tweet.find(:all, :conditions=>["id>?", since])
    tweets.each do |t|
      t.text = t.text
    end
    render :json=>tweets.to_json
  end
  
end
