class ItemSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :fields
  belongs_to :stock
  belongs_to :user
  belongs_to :category
end
