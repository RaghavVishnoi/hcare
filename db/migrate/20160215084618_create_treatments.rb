class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
    	t.string :treatment
    	t.integer :first_aid_id
    	t.timestamps
    end
    add_foreign_key :treatments,:first_aids
  end
end
