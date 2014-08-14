class MainorderboardSuborder
  include Mongoid::Document
 	belongs_to :mainorderboard
 	belongs_to :suborder
 


end
