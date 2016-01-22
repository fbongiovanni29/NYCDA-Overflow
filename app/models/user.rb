class User < ActiveRecord::Base
  # attr_accessor :password
  has_many :questions, class_name: "Post"
  has_many :answers
  has_secure_password
	  
  #validates presence of user paramaters on the create controller
  validates_presence_of :firstname, :on => :create
  validates_presence_of :lastname, :on => :create
  validates :password, length: { in: 6..20, message: "Length needs to be between 6 and 20 characters" }, allow_nil: true, :on => :create

  validates :email, :presence=> true, :uniqueness => true, :on => :create

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
