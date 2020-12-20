class StockSerializer
  include JSONAPI::Serializer
  attributes :id, :ticker, :name, :price
end
