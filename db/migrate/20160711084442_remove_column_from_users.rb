class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users,:token
  end
end
