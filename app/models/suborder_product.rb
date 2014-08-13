class SuborderProduct
  include Mongoid::Document
  has_many :suborders
  has_many :products
  accepts_nested_attributes_for :products
  accepts_nested_attributes_for :suborders


end
