class Workday < ActiveRecord::Base
	belongs_to :user

	scope :default_order, order('created_at DESC')
	#scope :current_week, where('created_at >= ?',Time.zone.now.begining_of_week)
	scope :on_today, where('created_at > ?', Time.zone.now.change(:hour => 0))
end

# == Schema Information
#
# Table name: workdays
#
#  id         :integer         not null, primary key
#  date :string(8)
#  is_workday :boolean
#  memo		  :string
#  created_at :datetime
#  updated_at :datetime
#