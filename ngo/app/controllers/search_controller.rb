class SearchController < ApplicationController
  def search
  end

  def show
    @organisations = Organisation.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organisations }
    end
  end
end
