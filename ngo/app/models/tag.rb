class Tag < ActiveRecord::Base
  attr_accessible :active, :description, :name
  
  has_and_belongs_to_many :organisations
end
