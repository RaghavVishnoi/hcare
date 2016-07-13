class ChangeColumnStatusIntoCenters < ActiveRecord::Migration
  def change
  	change_column :centers,:status,:string
  end
end
