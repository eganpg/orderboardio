class Session
  include Mongoid::Document

   validates :email, presence: true
  validates :password_digest, presence: true 
end