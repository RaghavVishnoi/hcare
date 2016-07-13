class AddColumnStatusIntoTrainers < ActiveRecord::Migration
  def change
  	add_column :trainers,:status,:string,null: false
  end
end
