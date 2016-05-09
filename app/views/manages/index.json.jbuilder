json.array!(@manages) do |manage|
  json.extract! manage, :id, :name, :price, :ingredient, :pictures
  json.url manage_url(manage, format: :json)
end
