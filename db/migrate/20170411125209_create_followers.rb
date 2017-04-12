class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.integer  :user_id,     limit: 4,       null: false
      t.integer  :follower_id, limit: 4,       null: false
      t.timestamps
    end
    add_index :followers, [:user_id],     name: 'followers_user_id'
    add_index :followers, [:follower_id], name: 'followers_follower_id'
  end
end
