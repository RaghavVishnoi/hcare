class ViewPagerSerializer < ActiveModel::Serializer
  attributes :id, :image_url

  def image_url
  	puts "oooooooooooo #{object.to_json}"
  	object.view_pager_url
  end
end
