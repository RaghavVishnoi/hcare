class AddColumnIntoAssociatedRoles < ActiveRecord::Migration
  def change
  	add_column :associated_roles,:object_type,:string
  end
end
