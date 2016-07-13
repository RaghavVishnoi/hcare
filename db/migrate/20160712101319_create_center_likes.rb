class CreateCenterLikes < ActiveRecord::Migration
  def change
    create_table :center_likes do |t|
    	t.integer :center_id
    	t.integer :user_id
    	t.boolean :status,default: true
    	t.timestamps
    end
    add_foreign_key :center_likes,:centers
    add_foreign_key :center_likes,:users
  end
end
