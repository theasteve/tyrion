class SpacSerializer
  include JSONAPI::Serializer
  attributes :id, :ticker, :name, :target, :definitive_agreement,
             :preliminary_filing, :first_revision, :second_revision,
             :third_revision, :definitive_filing, :merger_meeting,
             :expected_close, :investor_presentation_url
end
