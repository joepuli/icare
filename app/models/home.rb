class Home
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  # constants
  OPTIONS = [
    'Yes',
    'No',
    'Negotiable',
    'Do not know'
  ].freeze

  PETS = [
    'Cats',
    'Dogs',
    'Other'
  ].freeze

  # associations
  embedded_in :profile
  has_one :address

  # fields
  field :t, as: :can_family_travel_for_preplacement_visits, type: String
  field :pay, as: :can_family_pay_for_preplacement_visits, type: String
  field :w, as: :is_your_home_wheelchair_accessible, type: String
  field :pet, as: :pets_in_the_home, type: String

  # validations
  validates :is_your_home_wheelchair_accessible, presence: true
  validates :can_family_travel_for_preplacement_visits,
            :can_family_pay_for_preplacement_visits,
            inclusion: { in: OPTIONS }
  validates :pets_in_the_home, inclusion: { in: PETS }, allow_nil: true

  # accepts nested attributes
  accepts_nested_attributes_for :address,
                                reject_if: proc { |obj| obj[:zip].blank? }
end
