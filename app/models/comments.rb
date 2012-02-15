class Comments < ActiveRecord::Base
	belongs_to :posts, :counter_cache => true	
end
