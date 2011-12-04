class Post < ActiveRecord::Base
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  title      :string(255)
#  permalink  :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

