class Risk
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  FACTORS = [
    'Alcohol exposed',
    'Intellectual disability in birth family',
    'Domestic-violence exposed',
    'Mental illness in birth family',
    'Drug exposed - in home',
    'Premature birth',
    'Failure to thrive',
    'Schizophrenia in birth family',
    'History of abuse or neglect',
    'Sexual abuse',
    'History of multiple placements'
  ].freeze

  # associations
  embedded_in :preference

  # field
  field :r, as: :risk_factors_your_family_will_consider, type: Array

  # validations
  validates :r, inclusion: { in: FACTORS }, allow_nil: true
end
