class Suborder
  include Mongoid::Document
  field :vendorname, type: String
  field :email, type: String
  
 
  
  
 
  has_many :mainorderboard_suborders
  has_many :products
  belongs_to :login
  accepts_nested_attributes_for :mainorderboard_suborders
  
  # below is an example of what it is going to look like when we use active record.
  # has_many :products, through: :suborder_products

  # The following three methods dack out the above has many
  
  # bring back an array of products
  # def products
  # 	# Product.find(self.suborder_products.map(&:product_id))
  # 	Product.find product_ids
  	
  # end
  # # Bring back an array with all product ids
  # def product_ids
  # 	self.suborder_products.map(&:product_id)
  # end

  # # update product IDs fr this playlist
  # def product_ids=(list)
  # 	self.suborder_products.destroy
  # 	list.each do |prod_id|
  # 		unless prod_id.blank?
  # 			self.suborder_products.create(product_id: prod_id)
  # 		end
  # 	end
  # end
end
