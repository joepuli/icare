class Address
  include Mongoid::Document
  include Geocoder::Model::Mongoid
  include AddressHelper

  # attrs
  attr_accessor :full_address

  # associations
  belongs_to :addressable, polymorphic: true

  # geocode
  geocoded_by :full_address

  # fields
  field :coordinates, type: Array
  field :address_1, type: String
  field :address_2, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String

  # callbacks
  after_validation :geocode, if: ->(obj) { obj.full_address.present? }

  # instance methods
  def full_address
    [address_1, address_2, city, state, zip].reject(&:blank?).join(', ')
  end
end
