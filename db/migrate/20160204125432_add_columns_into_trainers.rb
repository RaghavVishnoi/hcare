class AddColumnsIntoTrainers < ActiveRecord::Migration
  def change
  	add_column :trainers,:lat,:string
  	add_column :trainers,:long,:string
  end
end
