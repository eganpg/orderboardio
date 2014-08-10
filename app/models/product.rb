class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: String
  field :description, type: String
  field :picture, type: String
  field :unit, type: String
  field :par, type: String
  field :onhand, type: String
  belongs_to :suborder
  belongs_to :productlist
  
end
