class ViewPager < ActiveRecord::Base

	mount_uploader :view_pager, ViewPagerUploader

	validates :view_pager, presence: true
	validates :status, presence: true

end