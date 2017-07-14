class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user_has_profile!, except: [:new, :create]
  before_action :load_countries, only: [:new, :edit]
  before_action :load_interests, only: [:new, :edit]
  before_action :restrict_profile_access, only: [:edit, :update]

  def index
    @profiles = Profile.search(search_params)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    if current_user.profile.present?
      redirect_to profile_path(current_user.profile), notice: "You have already created a profile."
    else
      @profile = current_user.build_profile  
    end
  end
  
  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      redirect_to profile_path(@profile), notice: "Profile was successfully created."
    else
      render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile was successfully updated."
    else
      render :edit
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:name, :bio, :country_id, interest_ids: [])
  end
  
  def search_params
    params.permit(country_ids: [], interest_ids: [])
  end

  def load_countries
    @countries = Country.all
  end
  
  def load_interests
    @interests = Interest.all
  end
  
  def restrict_profile_access
    if current_user.profile.id != params[:id].to_i
      redirect_to profile_path(current_user.profile), notice: "Operation not permitted."
    end
  end
end
