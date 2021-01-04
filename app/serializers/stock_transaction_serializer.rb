class StockTransactionSerializer
  include JSONAPI::Serializer
  attributes :id, :track, :following, :holding, :buying, :selling, :user_id, :stock_id
end

