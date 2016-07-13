class CreateTrainerLikes < ActiveRecord::Migration
  def change
    create_table :trainer_likes do |t|
    	t.integer :trainer_id,null: false
    	t.integer :user_id,null: false
    	t.timestamps
    end
    add_foreign_key :trainer_likes,:trainers
    add_foreign_key :trainer_likes,:users
  end
end
