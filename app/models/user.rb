class User < ActiveRecord::Base
  # attr_accessor :password

    has_secure_password
  

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates :password, length: { in: 6..20, message: "Length needs to be between 6 and 20 characters" }

  validates :email, :presence => true, :uniqueness => true
  
end
