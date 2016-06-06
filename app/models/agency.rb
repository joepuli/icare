class Agency
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps

  # associations
  embedded_in :profile
  has_one :address

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
  validates :contact_person, :agency_name, :address, :agency_phone,
            :contact_person_phone, :contact_person_email,
            :confirm_contact_person_email, presence: true

  validate :email_equals_confirm_email

  # class methods
  def self.search(user:, radius:)
    lon, lat = user.profile.address.coordinates
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
