class AddColumnToHomeWorkouts < ActiveRecord::Migration
  def change
  	add_column :home_workouts,:status,:string
  end
end
