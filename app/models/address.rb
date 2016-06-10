class Address
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  include Mongoid::Timestamps
  include AddressHelper

  # attrs
  attr_accessor :full_address

  # associations
  belongs_to :addressable, polymorphic: true
  embedded_in :home

  # geocode
  geocoded_by :full_address

  # fields
  field :a1, as: :home_address, type: String
  field :a2, as: :address_2, type: String
  field :city, type: String
  field :s, as: :state, type: String
  field :z, as: :zip, type: String
  field :c, as: :country, type: String
  field :co, as: :coordinates, type: Array

  # validations
  validates :home_address, :city, :state, :zip, presence: true

  # callbacks
  after_validation :geocode, if: ->(obj) { obj.city_changed? or obj.home_address_changed? or obj.state_changed? or obj.zip_changed? }

  # instance methods
  def full_address
    [home_address, address_2, city,
     state, zip, country
    ].reject(&:blank?).join(', ')
  end
end
