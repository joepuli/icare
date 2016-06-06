class Address
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  include AddressHelper

  # attrs
  attr_accessor :full_address

  # constants
  TYPES = [
    'United States (including territories)',
    'Military or Diplomatic (APO, DPO, FPO)',
    'International'
  ].freeze

  # associations
  belongs_to :addressable, polymorphic: true

  # geocode
  geocoded_by :full_address

  # fields
  field :a1, as: :home_address, type: String
  field :a2, as: :address_2, type: String
  field :city, type: String
  field :s, as: :state, type: String
  field :z, as: :zip, type: String
  field :c, as: :country, type: String
  field :t, as: :type, type: String
  field :co, as: :coordinates, type: Array

  # validations
  validates :home_address, :city, :state, :zip, :type, presence: true
  validates :type, inclusion: { in: TYPES }

  # callbacks
  after_validation :geocode, if: ->(obj) { obj.full_address.present? }

  # instance methods
  def full_address
    [home_address, address_2, city,
     state, zip, country
    ].reject(&:blank?).join(', ')
  end
end
