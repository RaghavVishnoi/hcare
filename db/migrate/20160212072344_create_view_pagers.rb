class CreateViewPagers < ActiveRecord::Migration
  def change
    create_table :view_pagers do |t|
    	t.string :view_pager
    	t.string :status
    	t.string :url
    end
  end
end
