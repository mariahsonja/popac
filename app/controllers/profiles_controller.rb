class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_countries, except: [:show]
  before_action :load_interests, except: [:show]

  def index
    @profiles = Profile.all
    if params[:search]
      @bikes = Profile.search(params[:search]).order("created_at DESC")
    else
      @bikes = Profile.all.order("created_at DESC")
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = current_user.build_profile
  end

  def edit
    @profile = current_user.profile
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profile_path, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:name, :bio, :country_id, interest_ids: [])
  end

  def load_countries
    @countries = Country.all
  end
  
  def load_interests
    @interests = Interest.all
  end
end
