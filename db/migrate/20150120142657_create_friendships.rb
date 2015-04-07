class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.column :user_id,:integer
	  t.column :friend_id,:integer
	  t.column :status,:integer
      t.column :created_at,:timestamp
    end
  end
end
