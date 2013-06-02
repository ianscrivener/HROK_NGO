class SearchController < ApplicationController
  def search
  end

  def show
    @organisations = Organisation.search(params[:search])
    @locations = Location.find_all_by_organisation_id(@organisations[0]).to_json
    render  :layout => 'map', :view => 'show'
  end
end
