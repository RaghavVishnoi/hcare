class AddColumnsIntoCenters < ActiveRecord::Migration
  def change
  	add_column :centers,:mfrom,:string
  	add_column :centers,:mto,:string
  	add_column :centers,:efrom,:string
  	add_column :centers,:eto,:string
  end
end
