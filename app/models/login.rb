require 'bcrypt'

class Login
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :firstName, type: String
  field :lastName, type: String
  field :username, type: String
  field :password_digest, type: String

  has_secure_password

  has_many :mainorderboards
end
