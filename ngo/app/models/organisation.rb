class Organisation < ActiveRecord::Base
  attr_accessible :main_email, :main_fax, :main_phone, :main_url, :name_display, :name_full, :name_short, :ngo_long_description, :ngo_short_description

  has_many :locations
end
