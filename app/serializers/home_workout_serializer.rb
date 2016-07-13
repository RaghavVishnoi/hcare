class HomeWorkoutSerializer < ActiveModel::Serializer
  attributes :id, :image_url

  def image_url
  	object.home_workout_url
  end

end