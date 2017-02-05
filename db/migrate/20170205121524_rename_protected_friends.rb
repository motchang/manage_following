class RenameProtectedFriends < ActiveRecord::Migration[5.0]
  def change
    rename_column :friends, :protected, :private_account
  end
end
