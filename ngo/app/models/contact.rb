class Contact < ActiveRecord::Base
  attr_accessible :email, :in_main, :linkedin, :mobile, :name, :phone, :position, :skype
end
