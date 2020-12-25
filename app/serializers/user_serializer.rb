class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :image_url
end
