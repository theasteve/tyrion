class TopicSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :full_name
end
