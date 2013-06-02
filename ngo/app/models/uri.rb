class Uri < ActiveRecord::Base

  attr_accessible :uri_type, :type_other, :url
  
  belongs_to :organisation

end
