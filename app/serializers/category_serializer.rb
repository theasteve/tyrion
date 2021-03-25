class CategorySerializer
  include JSONAPI::Serializer
  attributes :id, :name, :fields
  belongs_to :user
  belongs_to :stock
  has_many :items do |object|
    Item.where(category_id: object.id).limit(5)
  end
end
