require 'bcrypt'

class Login
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :firstName, type: String
  field :lastName, type: String
  field :username, type: String
  field :password_digest, type: String

  
  
  validates :username, presence: true
  validates :password_digest, presence: true 
  validates_length_of :password_digest, minimum: 8, maximum: 16
  validates_uniqueness_of :username
  has_secure_password



  has_many :mainorderboards
  has_many :suborders
end
