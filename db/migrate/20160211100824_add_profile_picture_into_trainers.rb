class AddProfilePictureIntoTrainers < ActiveRecord::Migration
  def change
  	add_column :trainers,:profile_picture,:string
  end
end
