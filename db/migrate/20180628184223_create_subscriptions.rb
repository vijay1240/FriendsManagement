class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.boolean :subscribed, default: false
      t.integer :target_id
      t.integer :user_id
      t.boolean :blocked, default: false

      t.timestamps
    end
  end
end
