json.array!(@books) do |book|
  json.extract! book, :id, :name, :cover
  json.url book_url(book, format: :json)
end
