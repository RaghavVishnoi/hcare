class UpdateImages < ActiveRecord::Migration
  def change
  	remove_column :images,:resource_id
  	remove_column :images,:resource_type
  	add_column    :images,:imageable_type,:string
  	add_column    :images,:imageable_id,:integer
  	add_index     :images, [:imageable_id, :imageable_type]
  end
end
