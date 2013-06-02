class SearchController < ApplicationController
  def search
  end

  def show
    @organisations = Organisation.search(params[:search])
    render  :layout => 'map', :view => 'show'
  end
end
