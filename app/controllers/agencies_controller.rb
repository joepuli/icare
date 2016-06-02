class AgenciesController < ApplicationController
  respond_to :html, :js
  def index
    @agencies = Agency.search(user: current_user, radius: params.fetch(:radius, 10))
    @location = current_user.profile.address.coordinates
    @hash = Gmaps4rails.build_markers(@agencies) do |agency, marker|
      marker.lat agency.location.latitude
      marker.lng agency.location.longitude
      marker.infowindow render_to_string(partial: 'agency',
                                         locals: { agency: agency })
    end
    respond_with(agencies: @agencies, hash: @hash, location: @location)
  end
end
