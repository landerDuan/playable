class Report < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  
  scope :default_order, order('created_at DESC')
  scope :current_week,  where('created_at >= ?', Time.zone.now.beginning_of_week)
  scope :on_today,      where('created_at > ?', Time.zone.now.change(:hour => 0))
end

# == Schema Information
#
# Table name: reports
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  plan         :text
#  goal         :text
#  content      :text
#  score        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  current_date :datetime
#

