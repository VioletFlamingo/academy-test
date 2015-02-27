json.array!(@cities) do |city|
  json.extract! city, :id, :name, :short_name
  json.url city_url(city, format: :json)
end
