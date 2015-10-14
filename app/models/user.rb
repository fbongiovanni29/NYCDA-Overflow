require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  attr_accessor :password

  def password
	  @password ||= Password.new(password_digest)
  end

  def password=(new_password)
	  @password = Password.create(new_password)
	  self.password_digest = @password
  end
  
  has_secure_password
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates :email, :presence => true, :uniqueness => true
  #validates :password, length: { in: 6..20 }
  

end
