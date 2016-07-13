class CreateHomeWorkouts < ActiveRecord::Migration
  def change
    create_table :home_workouts do |t|
    	t.string :title,null: false
    	t.text :description
    	t.string :photo_url
    	t.timestamps
    end
  end
end
