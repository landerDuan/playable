class Comment < ActiveRecord::Base
	belongs_to :post, :counter_cache => true
end
# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  post_id    :integer
#  name       :string(255)
#  email      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

