class Mainorderboard
  include Mongoid::Document
  field :name, type: String
  
  has_many :suborders
  belongs_to :login
end
