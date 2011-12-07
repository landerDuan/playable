class Mark < ActiveRecord::Base
  
  attr_accessor :number
  
  
  belongs_to :user
end
# == Schema Information
#
# Table name: marks
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

