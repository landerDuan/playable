class Page < ActiveRecord::Base
end
# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  name_zh    :string(255)
#  name_en    :string(255)
#  name_jp    :string(255)
#  code       :string(255)
#  content_zh :text
#  content_en :text
#  content_jp :text
#  priority   :string(255)
#  position   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

