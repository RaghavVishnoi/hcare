class CreateAssociatedRoles < ActiveRecord::Migration
  def change
    create_table :associated_roles do |t|
    	t.integer :object_id,null: false
    	t.integer :role_id,null: false
        t.timestamps null: false
    end
    add_foreign_key :associated_roles,:users,column: :object_id
  	add_foreign_key :associated_roles,:roles
  end
end
