class AddColumnIntoHomeWorkouts < ActiveRecord::Migration
  def change
  	add_column :home_workouts,:home_workout,:string
  end
end
