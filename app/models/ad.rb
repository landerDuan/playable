class Ad < ActiveRecord::Base
	symbolize :position, :in => [:index], :methods => true, :allow_nil => true
end
