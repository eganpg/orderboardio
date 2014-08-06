class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: String
  field :description, type: String
  field :picture, type: String
  field :unit, type: String
  belongs_to :productlist
  belongs_to :suborder
end
