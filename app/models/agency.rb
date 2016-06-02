class Agency
  # include Mongoid::Document

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
end
