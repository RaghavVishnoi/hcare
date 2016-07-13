class CreateTrainerReviews < ActiveRecord::Migration
  def change
    create_table :trainer_reviews do |t|
    	t.text :review
    	t.integer :rating,null: false
    	t.integer :user_id,null: false
    	t.integer :trainer_id,null: false
    	t.timestamps
    end
    add_foreign_key :trainer_reviews,:trainers
    add_foreign_key :trainer_reviews,:users
  end
end
