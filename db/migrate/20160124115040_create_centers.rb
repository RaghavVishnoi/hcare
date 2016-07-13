class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
    	t.string :email
    	t.string :contact_number,null: false
    	t.string :website
    	t.text   :address,null: false
    	t.string :registration_number,null: false
    	t.string :registered_by,null: false
    	t.string :owner_name,null: false
    	t.string :owner_contact_number
    	t.text   :owner_address
    	t.string :owner_email
    	t.string :contact_person,null: false
    	t.string :contact_person_contact_number,null: false
    	t.text   :contact_person_address,null: false
    	t.string :working_hours,null: false
    	t.string :started_at,null: false
    	t.string :awards_and_achievements
    	t.integer :category_id,null: false
    end
    add_foreign_key :centers,:categories
  end
end
