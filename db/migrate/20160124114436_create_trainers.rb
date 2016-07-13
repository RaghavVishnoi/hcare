class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
    	t.string :name, null: false
    	t.string :personal_contact_number, null: false
    	t.string :alternate_contact_number
    	t.string :gender,null: false
    	t.string :email
    	t.text   :bio,null: false
    	t.text   :awards_and_certificates
    	t.integer :category_id,null: false
    	t.text   :address,null: false 
    end
    add_foreign_key :trainers,:categories
  end
end
