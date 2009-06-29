module SpamHelper
  
  def rating_text follower
    case follower.rating
    when 0.0..0.1: "<span class=\"bad\">BAD</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
    when 0.1..0.3: "<span class=\"medium\">Medium</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
    when 0.3..1.0: "<span class=\"good\">Good</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
    when 1.0..2.0: "<span class=\"good\">Great</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
    else "<span class=\"whale\">Whale!</span> <span class=\"rating\">(#{follower.rating.round(2)})</span>"
    end
  end
  
  def rating_suggestion follower
    case follower.rating
    when 0.0..0.1: "This is probably a spammer. #{link_to_remote 'Block this user', :url=>{:action=>'block', :id=>follower.id}, :update=>"suggestion_#{follower.id}"}"
    when 0.1..0.3: "This might be a spammer. <a href=\"http://www.twitter.com/#{follower.screen_name}\" target=\"_blank\">Check out users profile</a> and make a decision"
    else "This is probably a regular twitterer. You might want to #{link_to_remote 'follow this user', :url=>{:action=>'follow', :id=>follower.id}, :update=>"suggestion_#{follower.id}"}"
    end
    
  end
end
