class Wiki < ActiveRecord::Base
	validates :name, :url, :priority, :presence => true
	validates :priority, :numericality => { :integer_only => true }
end
# == Schema Information
#
# Table name: wikis
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  url        :string(255)
#  priority   :integer         default(0)
#  created_at :datetime
#  updated_at :datetime
#

