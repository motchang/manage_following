class AddLoveToFriends < ActiveRecord::Migration[5.0]
  def change
    add_column :friends, :love, :boolean
  end
end
