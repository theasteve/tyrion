class ResponseSerializer
  include JSONAPI::Serializer
  attributes :id, :description, :date, :price
  # belongs_to :topic
  # belongs_to :user
end
