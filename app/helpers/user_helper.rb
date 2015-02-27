module UserHelper
  def city_for_user(city_id)
    city = City.find_by_id(city_id).name if city_id
  end
end