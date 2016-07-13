class AddModelIntoImages < ActiveRecord::Migration
  def change
  	add_column :images,:model,:string
  end
end
