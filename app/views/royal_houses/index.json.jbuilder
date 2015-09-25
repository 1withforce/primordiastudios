json.array!(@royal_houses) do |royal_house|
  json.extract! royal_house, :id, :name, :alliance, :description
  json.url royal_house_url(royal_house, format: :json)
end
