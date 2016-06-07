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
  has_many :races

  # fields
  field :dob, as: :birth_month_and_year, type: Date
  field :g, as: :gender, type: String
  field :in, as: :child_became_part_of_family_by, type: String
  field :cd, as: :any_challenges_or_disabilities?, type: String

  # validations
  validates :birth_month_and_year, :gender, 
            :child_became_part_of_family_by, presence: true
  validates :child_became_part_of_family_by, inclusion: { in: MEMBERSHIP }

  # nested attribtes
  accepts_nested_attributes_for :races
end
