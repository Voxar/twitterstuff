class CreateWants < ActiveRecord::Migration
  def self.up
    create_table :wants do |t|
      t.string :user
      t.string :text
      t.string :text_original
      t.string :image_url
      t.string :lang
      t.string :twitt_id
      t.string :user_id
      t.timestamp :date
      t.timestamps
    end
  end

  def self.down
    drop_table :wants
  end
end
