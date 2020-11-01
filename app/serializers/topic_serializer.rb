class TopicSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :description, :questions
end
