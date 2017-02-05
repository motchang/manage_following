class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.string :id_str
      t.string :screen_name
      t.string :name
      t.string :location
      t.text :description
      t.string :url
      t.boolean :protected
      t.integer :followers_count
      t.integer :friends_count
      t.integer :listed_count
      t.datetime :created_at
      t.integer :favourites_count
      t.integer :statuses_count
      t.string :lang
      t.timestamp :last_tweet_at
      t.string :last_tweet
      t.string :profile_image_url
      t.string :profile_image_url_https
    end
  end
end
