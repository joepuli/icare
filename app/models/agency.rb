class Agency
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  DEFAULT_LOCATION = 'California, CA'.freeze

  # associations
  belongs_to :profile
  embeds_one :address, as: :addressable

  # fields
  field :cpn, as: :contact_person, type: String
  field :an, as: :agency_name, type: String
  field :ap, as: :agency_phone, type: String
  field :af, as: :agency_fax, type: String
  field :cpp, as: :contact_person_phone, type: String
  field :cpe, as: :contact_person_email, type: String
  field :ccpe, as: :confirm_contact_person_email, type: String

  # nested attributes
  accepts_nested_attributes_for :address,
                                reject_if: proc { |obj| obj[:zip].blank? }

  # validations
  validates :contact_person, :agency_name, :agency_phone,
            :contact_person_phone, :contact_person_email,
            :confirm_contact_person_email, presence: true

  validate :email_equals_confirm_email
  validates :address, associated: true

  # class methods
  def self.location_coordinates(user:, params:)
    location = determine_location_source(user, params)
    return location if location.is_a?(Array)
    Geocoder.coordinates(location).reverse
  end

  def self.search(user:, params:)
    radius = params.fetch(:radius, 10)
    lon, lat = location_coordinates(user: user, params: params)
    query_soda(lat: lat, lon: lon, radius: radius)
  end

  def self.determine_location_source(user, params)
    if params.fetch(:zip, '').match(/(\d{5})/).present?
      params[:zip]
    elsif user.try(:profile).try(:home)
      user.profile.home.address.coordinates
    else
      DEFAULT_LOCATION
    end
  end

  def self.query_soda(lat:, lon:, radius:)
    meters = Geocoder::Calculations.to_kilometers(radius.to_i) * 1000
    client.get('v9bn-m9p9', { "$where" => "within_circle(location, #{lat}, #{lon}, #{meters})" })
  end

  def self.client
    SODA::Client.new(domain: 'chhs.data.ca.gov',
                     app_token: Rails.application.secrets.soda_api_token )
  end

  # instance methods
  def email_equals_confirm_email
    if confirm_contact_person_email != contact_person_email
      errors.add(:confirm_contact_person_email, "must equal contact person email")
    end
  end
end
