class Location < ActiveRecord::Base
  attr_accessible :address1, :address2, :address_name, :country, :country_code, :geo_admin_0, :geo_admin_1, :geo_admin_2, :geo_admin_3, :geo_admin_4, :geo_dlat, :geo_dlong, :geo_geocode_modified, :geo_geocode_reqd, :is_main, :postcode, :state, :suburb
end
