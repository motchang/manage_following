class FollowingsController < ApplicationController
  SLICE_SIZE = 100

  def index
    @all_friends = Friend.where(user: current_user)
  end

  def refresh
    client = Twitter::REST::Client.new do |config|
      # applicationの設定
      config.consumer_key         = Settings.twitter_key
      config.consumer_secret      = Settings.twitter_secret
      # ユーザー情報の設定
      user_auth = current_user.authentications.first
      config.access_token         = user_auth.token
      config.access_token_secret  = user_auth.secret
    end

    all_followers = []
    client.follower_ids.each_slice(SLICE_SIZE).each do |slice|
        client.users(slice).each do |follower|
          all_followers << follower.id
        end
    end
    ActiveRecord::Base.transaction do
      Friend.where(user: current_user).delete_all
      client.friend_ids.each_slice(SLICE_SIZE).each do |slice|
        client.users(slice).each do |friend|
          a = Friend.new
          a.id                      = friend.id
          a.user                    = current_user
          a.id_str                  = friend.id.to_s
          a.screen_name             = friend.screen_name
          a.name                    = friend.name
          a.location                = friend.location
          a.description             = friend.description
          a.url                     = friend.url
          a.private_account         = friend.protected
          a.followers_count         = friend.followers_count
          a.friends_count           = friend.friends_count
          a.listed_count            = friend.listed_count
          a.created_at              = friend.created_at
          a.favourites_count        = friend.favourites_count
          a.statuses_count          = friend.statuses_count
          a.lang                    = friend.lang
          a.last_tweet_at           = friend.status.created_at
          a.last_tweet              = friend.status.text
          a.profile_image_url       = friend.profile_image_url
          a.profile_image_url_https = friend.profile_image_url_https
          a.love                    = all_followers.include?(friend.id)
          a.save!
        end
      end
    end
    redirect_to '/followings'
  end
end
