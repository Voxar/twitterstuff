require 'rubygems'
require 'twitter'

want = Twitter::Search.new('#want OR #wants')

def fixtext text
  text.gsub(/#wants? ?/i, "")
end

want.each do |i|
  p i.inspect
end

puts "-"*20
want.each do |i|
  puts "#{i.from_user} wants: #{fixtext(i.text)}"
  m = Want.new
  m.user = i.from_user
  m.text = fixtext(i.text)
  m.text_original = i.text
  m.image_url = i.profile_image_url
  m.lang = i.iso_language_code
  m.twitt_id = i.id
  m.user_id = i.user_id
  m.date = i.created_at
  m.save
end


#load tweets
query = []
Twitter::Trends.current.each do |trend|
  query << trend.query
end

query = query.join(" OR ")
 
tweets = Twitter::Search.new(query).per_page(100)

tweets.each do |tweet|
  Tweet.create({
    :from_user => tweet.from_user,
    :text => tweet.text,
    :profile_image_url => tweet.profile_image_url,
    :iso_language_code => tweet.iso_language_code,
    :tweet_id => tweet.id,
    :user_id => tweet.from_user_id,
    :tweeted_at => tweet.created_at
  })
end