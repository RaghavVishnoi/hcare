class AddColumnIntoTrainers < ActiveRecord::Migration
  def change
  	add_column :trainers,:state,:string,null: false
  	add_column :trainers,:city,:string,null: false
  	add_column :trainers,:zip_code,:string,null: false
  end
end
