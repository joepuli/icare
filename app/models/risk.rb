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
  belongs_to :preference

  # field
  field :n, as: :name

  # validations
  validates :n, inclusion: { in: FACTORS }
end
