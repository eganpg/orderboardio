require 'bcrypt'


class Login
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :firstName, type: String
  field :lastName, type: String
  field :email, type: String
  field :password_digest, type: String
  
  validates :email, presence: true
  validates :password_digest, presence: true 
  validates_length_of :password_digest, minimum: 8
  validates_uniqueness_of :email
  has_secure_password
  
  has_many :mainorderboards
  has_many :suborders
  # before_create { generate_token(:auth_token) } 

  # def generate_token(column)
  #   begin
  #     self[column] = SecureRandom.urlsafe_base64
  #   end while Login.exists?(column => self[column])
  # end

  # def send_password_reset
  #   generate_token(:password_reset_token)
  #   self.password_reset_sent_at = Time.zone.now
  #   save!
  #   LoginMailer.password_reset(self).deliver
  # end
 
end
