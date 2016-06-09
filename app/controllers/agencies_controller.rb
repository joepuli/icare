class AgenciesController < ApplicationController
  layout 'profile', only: :index
  before_action :find_profile, except: :index
  before_action :find_agency, only: [:edit, :update, :show]
  respond_to :html, :js

  def index
    @agencies = Agency.search(user: current_user, params: params)
    @location = Agency.location_coordinates(user: current_user, params: params)
    @hash = Gmaps4rails.build_markers(@agencies) do |agency, marker|
      marker.lat agency.location.latitude
      marker.lng agency.location.longitude
      marker.infowindow render_to_string(partial: 'agency',
                                         locals: { agency: agency })
    end
    respond_with(agencies: @agencies, hash: @hash, location: @location)
  end

  def new
    @agency = @profile.build_agency
    @agency.build_address
  end

  def create
    @agency = @profile.build_agency(agency_attributes)
    if @agency.save
      redirect_to [@profile, @agency]
    else
      @agency.build_address
      render :new
    end
  end

  def show
  end

  def edit
    @address = @agency.build_address if @agency.address.blank?
  end

  def update
    if @agency.update_attributes(agency_attributes)
      redirect_to [ @profile, @agency ]
    else
      @address = @agency.build_address if @agency.address.blank?
      render :edit
    end
  end

  private

  def agency_attributes
    params.require(:agency).permit(:contact_person, :agency_name,
                                    :agency_phone, :agency_fax,
                                    :contact_person_phone,
                                    :contact_person_email,
                                    :confirm_contact_person_email,
                                    address_attributes: [:home_address, :city,
                                                         :address_2, :state,
                                                         :zip]
                                    )
  end

  def find_profile
    @profile = Profile.find(params[:profile_id])
  end

  def find_agency
    @agency = Agency.find(params[:id])
  end
end
