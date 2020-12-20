class StockSerializer
  include JSONAPI::Serializer
  attributes :ticker, :name, :price
end
