class CreateFirstAids < ActiveRecord::Migration
  def change
    create_table :first_aids do |t|
    	t.string :symptoms
    	t.timestamps
    end
  end
end
