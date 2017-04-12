class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer :user_id, limit: 4,       null: false
      t.string  :tweet,   limit: 256,     null: false
      t.timestamps
    end
    add_index :tweets, [:user_id], name: 'tweets_user_id'
  end
end
