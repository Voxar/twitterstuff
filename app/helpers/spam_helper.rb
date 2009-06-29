module SpamHelper
  
  def rating_text follower
    case follower.rating
    when 0.0..0.1: "<span class=\"bad\">BAD</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
    when 0.1..0.3: "<span class=\"medium\">Medium</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
    when 0.3..1.0: "<span class=\"good\">Good</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
    else "<span class=\"good\">Great</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
#    else "<span class=\"whale\">Whale!</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
    end
  end
  
  def link_to_block follower, text='Block this user'
    "#{link_to_remote text, :url=>{:action=>'block', :id=>follower.id}, :update=>"suggestion_#{follower.id}"}"
  end
  
  def link_to_follow follower, text='follow this user'
    "#{link_to_remote text, :url=>{:action=>'follow', :id=>follower.id}, :update=>"suggestion_#{follower.id}"}"
  end
  
  def rating_suggestion follower
    case follower.rating
    when 0.0..0.1: "This is probably a spammer. #{link_to_block(follower)}"
    when 0.1..0.3: "This might be a spammer. <a href=\"http://www.twitter.com/#{follower.screen_name}\" target=\"_blank\">Check users profile</a> and then maybe #{link_to_block(follower, 'block')} or #{link_to_follow(follower, 'follow')}"
    else "This is probably a regular twitterer. You might want to #{link_to_follow(follower)}"
    end
    
  end
end
