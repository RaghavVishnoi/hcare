class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.integer :user_id,null: false
    	t.string  :role,null: false
    	t.timestamps
    end
    add_foreign_key :roles,:users
  end
end
