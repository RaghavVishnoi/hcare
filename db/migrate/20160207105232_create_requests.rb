class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.integer :target_id,null: false
    	t.integer :user_id,null: false
    	t.boolean :accept,null: false
    	t.boolean :seen,null: false
    	t.timestamps
    end
    add_foreign_key :requests,:users,column: :target_id
    add_foreign_key :requests,:users
  end
end
