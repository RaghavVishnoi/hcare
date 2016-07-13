class AddColumnsIntoUsers < ActiveRecord::Migration
  def change
  	add_column :users,:username,:string
  	add_column :users,:gender,:string
  	add_column :users,:facebook_user_id,:string
  	add_column :users,:facebook_user_token,:text
  	add_column :users,:photo_url,:string
  end
end
