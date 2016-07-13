class UpdateDatatypeIntoTrainers < ActiveRecord::Migration
  def change
  	remove_column :trainers,:latitude
  	remove_column :trainers,:longitude
  	add_column :trainers,:latitude,:float
  	add_column :trainers,:longitude,:float
  end
end