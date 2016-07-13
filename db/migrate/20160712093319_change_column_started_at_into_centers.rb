class ChangeColumnStartedAtIntoCenters < ActiveRecord::Migration
  def change
  	rename_column :centers,:started_at,:started_in
  end
end
