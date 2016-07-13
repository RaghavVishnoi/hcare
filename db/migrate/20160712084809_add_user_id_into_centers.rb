class AddUserIdIntoCenters < ActiveRecord::Migration
  def change
  	add_column :centers,:user_id,:integer
  	add_foreign_key :centers,:users
  end
end
