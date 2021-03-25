class ItemSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :values
  belongs_to :user
  belongs_to :category
end
