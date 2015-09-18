json.array!(@groceries) do |grocery|
  json.extract! grocery, :id, :title, :date, :description
  json.url grocery_url(grocery, format: :json)
end
