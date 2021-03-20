class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :fields
  belongs_to :user
  belongs_to :stock
  has_many :items
end
