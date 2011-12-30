class Event < ActiveRecord::Base
	belongs_to :user

	def check_in
		@event = self.new
    @event.user_id = current_user[:id]
    @event.checkin_at = Time.now
    @event.save
    redirect_to events_path
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

