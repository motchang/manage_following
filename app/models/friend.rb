# == Schema Information
#
# Table name: friends
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  id_str                  :string
#  screen_name             :string
#  name                    :string
#  location                :string
#  description             :text
#  url                     :string
#  protected               :boolean
#  followers_count         :integer
#  friends_count           :integer
#  listed_count            :integer
#  created_at              :datetime
#  favourites_count        :integer
#  statuses_count          :integer
#  lang                    :string
#  last_tweet_at           :datetime
#  last_tweet              :string
#  profile_image_url       :string
#  profile_image_url_https :string
#  love                    :boolean
#

class Friend < ApplicationRecord
  belongs_to :user
end
