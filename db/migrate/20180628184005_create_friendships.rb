class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.boolean :approved, default: false
      t.integer :friend_id
      t.integer :user_id

      t.timestamps
    end
  end
end
