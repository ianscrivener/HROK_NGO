class Organisation < ActiveRecord::Base
  attr_accessible :main_email, :main_fax, :main_phone, :main_url, :name_display, :name_full, :name_short, :ngo_long_description, :ngo_short_description

  has_many :locations
  has_many :uris
  has_and_belongs_to_many :services
  has_and_belongs_to_many :tags  

  def self.search(search)
    if search 
      find(:all, :conditions => ['name_display LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end


end
