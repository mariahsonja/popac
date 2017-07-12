class SearchController < ApplicationController
  def index
    @profiles = Profile.search(search_params)
  end
  
  private
  
  def search_params
    params.permit(country_ids: [], interest_ids: [])
  end
end