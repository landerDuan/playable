class Event < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  
  before_validation :validate_checking

  scope :get_week_events, where("checkin_at >= '#{Time.now.beginning_of_week}' and checkin_at <= '#{Time.now.end_of_week}'")

  # before_validation :validate_checking
  
  # def validate_checking
  #     if user.already_checked_in?
  #     p "errors?"*10
  #     errors.add(:checkin_at, I18n.t('messages.already_checked_in'))  
  #     #p "#{errors.full_messages}"
  #     end
  # end

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

