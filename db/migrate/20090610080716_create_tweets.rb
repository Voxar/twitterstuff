class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.string :from_user
      t.string :text
      t.string :profile_image_url
      t.string :iso_language_code
      t.string :tweet_id
      t.string :user_id
      t.string :tweeted_at
      t.string :to_user_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
