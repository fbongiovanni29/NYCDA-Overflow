class User < ActiveRecord::Base
  attr_accessor :password
  
  has_secure_password
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  
	# before_save :encrypt_password
	# after_save :clear_password
	# def encrypt_password
	#   if password.present?
	#     self.salt = BCrypt::Engine.generate_salt
	#     self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
	#   end
	# end
	# def clear_password
	#   self.password = nil
	# end

end
