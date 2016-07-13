class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string  :image, null: false
    	t.string  :resource_type
    	t.integer :resource_id
    	t.string  :lat
    	t.string  :long
    end
  end
end
