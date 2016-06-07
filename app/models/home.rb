class Home
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include HomeHelper

  # associations
  embedded_in :profile
  embeds_one :address, as: :addressable

  # fields
  field :t, as: :can_family_travel_for_preplacement_visits, type: String
  field :pay, as: :can_family_pay_for_preplacement_visits, type: String
  field :w, as: :is_your_home_wheelchair_accessible, type: String
  field :pet, as: :pets_in_the_home, type: String
  field :at, as: :address_type, type: String

  # validations
  validates :is_your_home_wheelchair_accessible, :address_type, presence: true
  validates :can_family_travel_for_preplacement_visits,
            :can_family_pay_for_preplacement_visits,
            inclusion: { in: OPTIONS }, allow_blank: true
  validates :pets_in_the_home, inclusion: { in: PETS }, allow_blank: true
  validates :address_type, inclusion: { in: ADDRESS_TYPES }
  validates :address, associated: true

  # accepts nested attributes
  accepts_nested_attributes_for :address,
                                reject_if: proc { |obj| obj[:zip].blank? }
end
