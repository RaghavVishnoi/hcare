class AddColumnIntoTrainerLikes < ActiveRecord::Migration
  def change
  	add_column :trainer_likes,:status,:boolean,default: true
  end
end
