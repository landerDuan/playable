class Event < ActiveRecord::Base
  belongs_to :user, :counter_cache => true

  #default_scope order('created_at DESC')
  scope :current_week, where('created_at >= ?', Time.zone.now.beginning_of_week)
  scope :detail_order, order('created_at DESC')
  scope :today_event, where('created_at >= ?', Time.zone.now.to_date)

end
# == Schema Information
#
# Table name: events
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  checkin_at      :datetime
#  checkout_at     :datetime
#  description     :text
#  feedback        :text
#  type_identifier :string(255)
#  state           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

