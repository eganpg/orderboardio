class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: String
  field :description, type: String
  field :picture, type: String
  field :unit, type: String
  field :par, type: String
  field :onhand, type: String
  field :add, type: Boolean
  # belongs_to :suborder
  
  # belongs_to :productlist
  # embedded_in :suborder_products
  

  belongs_to :suborder
  # accepts_nested_attributes_for :suborder_product

end
