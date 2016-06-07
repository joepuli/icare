class Race
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include ParentHelper

  # constants
  OPTIONS = [
    'African American/Black',
    'American Indian/Alaskan Native',
    'Asian',
    'Pacific Islander/Native Hawaiian',
    'White/Caucasian',
    'Unable To Determine',
    'Hispanic/Latino'
  ].freeze

  # associations
  belongs_to :raceable, polymorphic: true

  # fields
  field :n,  as: :name, type: String
end
