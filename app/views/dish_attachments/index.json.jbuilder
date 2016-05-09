json.array!(@dish_attachments) do |dish_attachment|
  json.extract! dish_attachment, :id, :dish_id, :image
  json.url dish_attachment_url(dish_attachment, format: :json)
end
