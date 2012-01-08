class Event < ActiveRecord::Base
  belongs_to :user, :counter_cache => true
  
  before_validation :validate_checking
  
  def validate_checking
    p "errors?"
    errors.add(:checkin_at, I18n.t('messages.already_checked_in')) if user.already_checked_in?
    p "#{errors.full_messages}"
  end

  def self.check_in(user_id)
    @new_event = Event.new(:user_id => user_id, :checkin_at => Time.now)
    @new_event.save
  end

  def check_out(user_id)
    @now_event = self.update_attributes(:user_id => user_id, :checkout_at => Time.now)
  end

  def status
    if !self.checkout_at.blank? && self.checkin_at < Time.now.to_date
      1
    elsif self.checkout_at.blank?
      2
    else
      3
    end  	
  end

  def auto_check_out
    self.checkout_at = Time.now.to_date.to_s << "23:59:59"
    self.save
  end

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

