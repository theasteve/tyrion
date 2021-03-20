class ItemSerializer
  include JSONAPI::Serializer
  attributes :id, :name 
  belongs_to :user
  belongs_to :category
end
