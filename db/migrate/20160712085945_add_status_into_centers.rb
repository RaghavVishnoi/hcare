class AddStatusIntoCenters < ActiveRecord::Migration
  def change
  	add_column :centers,:status,:boolean
  end
end
