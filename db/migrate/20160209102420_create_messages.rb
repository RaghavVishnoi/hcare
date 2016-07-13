class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.integer :request_id,null: false
    	t.integer :user_id,null: false
    	t.string  :user_type,null: false
    	t.string  :message_type,null: false
    	t.text    :content,null: false 
    	t.timestamps
    end
    add_foreign_key :messages,:users
    add_foreign_key :messages,:requests
  end
end
