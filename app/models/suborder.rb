class Suborder
  include Mongoid::Document
  field :vendorname, type: String
  field :email, type: String
  
  belongs_to :mainorderboard
  
  
  # embeds_many :suborder_products
  # embeds_many :products
  
  # has_many :products
  has_many :products
  

  # accepts_nested_attributes_for :suborder_product

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
