class SearchController < ApplicationController
  def search
  end

  def show
    @organisations = Organisation.search(params[:search])

    all_locations = []
    @organisations.each { |org|
       all_locations += Location.find_all_by_organisation_id(org)
    }

    @locations = all_locations.to_json
    render  :layout => 'map', :view => 'show'
  end
end
