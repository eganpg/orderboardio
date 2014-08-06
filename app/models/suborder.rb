class Suborder
  include Mongoid::Document
  field :vendorname, type: String
  field :email, type: String
  
  belongs_to :mainorderboard
  has_many :products
	 
end
