class Child
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include ParentHelper

  # constants
  MEMBERSHIP = [
    'Birth',
    'Adoption',
    'Foster Care',
    'Kinship',
    'Guardianship'
  ].freeze

  # associations
  embedded_in :profile

  # fields
  field :dob, as: :birth_month_and_year, type: Date
  field :g, as: :gender, type: String
  field :r, as: :race, type: Array
  field :in, as: :child_became_part_of_family_by, type: String
  field :cd, as: :any_challenges_or_disabilities?, type: String

  # validations
  validates :birth_month_and_year, :gender, :race,
            :child_became_part_of_family_by, presence: true
  validates :race, inclusion: { in: RACE }
  validates :child_became_part_of_family_by, inclusion: { in: MEMBERSHIP }
end
