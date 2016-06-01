class Training
  include Mongoid::Document

  # associations
  embedded_in :profile

  # fields
  field :name, type: String
end
