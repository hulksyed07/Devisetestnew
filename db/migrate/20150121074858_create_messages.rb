class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.column :sender_id,:integer
      t.column :recipient_id,:integer
	  t.column :body,:text
      t.column :created_at,:timestamp
     
    end
  end
end
