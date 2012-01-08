class Wiki < ActiveRecord::Base
	validates :name, :url, :priority, :presence => true
	validates :priority, :numericality => { :integer_only => true }
end
