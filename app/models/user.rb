class User < ActiveRecord::Base
  # attr_accessor :password

    has_secure_password
  

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates :password, length: { in: 6..20, message: "Length needs to be between 6 and 20 characters" }

  validates :email, :presence => true, :uniqueness => true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end
