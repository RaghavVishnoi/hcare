class AddUserIdIntoTrainers < ActiveRecord::Migration
  def change
  	add_column      :trainers,:user_id,:integer,null: false
  	add_foreign_key :trainers,:users
  end
end
