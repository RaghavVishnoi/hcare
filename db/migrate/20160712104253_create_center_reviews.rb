class CreateCenterReviews < ActiveRecord::Migration
  def change
    create_table :center_reviews do |t|
    	t.string :review
    	t.integer :rating
    	t.integer :user_id
    	t.integer :center_id
    	t.timestamps
    end
    add_foreign_key :center_reviews,:centers
    add_foreign_key :center_reviews,:users
  end
end
