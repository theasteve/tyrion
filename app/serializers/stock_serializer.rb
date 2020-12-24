class StockSerializer
  include JSONAPI::Serializer
  attributes :id, :ticker, :name, :following, :holding, :buying, :selling
end
