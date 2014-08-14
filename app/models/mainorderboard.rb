class Mainorderboard
  include Mongoid::Document
  field :name, type: String
  
  has_many :mainorderboard_suborders
  belongs_to :login
  accepts_nested_attributes_for :mainorderboard_suborders 


# bring back an array of products
  def suborders
  	# Product.find(self.suborder_products.map(&:product_id))
  	Suborder.find(suborder_ids)
  	
  end
  # Bring back an array with all product ids
  def suborder_ids
  	ret = []
  	self.mainorderboard_suborders.each do |r|
  		ret << r.suborder_id if r.suborder_id
  	end
  	ret
  end

  # update product IDs fr this playlist
  def suborder_ids=(list)
  	self.mainorderboard_suborders.destroy
  	list.each do |sub_id|
  		self.mainorderboard_suborders.create(suborder_id: sub_id) unless suborder_id.blank?
		end
	end
end


 