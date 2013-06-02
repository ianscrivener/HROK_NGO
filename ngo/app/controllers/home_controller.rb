class HomeController < ApplicationController

  def index
  	render  :layout => 'map', :view => 'index'
  end
end
