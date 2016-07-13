class AddColumnToFirstAid < ActiveRecord::Migration
  def change
  	add_column :first_aids,:status,:string
  end
end
