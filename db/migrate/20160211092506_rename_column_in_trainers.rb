class RenameColumnInTrainers < ActiveRecord::Migration
  def change
  	rename_column :trainers,:lat,:latitude
  	rename_column :trainers,:long,:longitude
  end
end
