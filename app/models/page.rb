class Page < ActiveRecord::Base
  
  validates :name_zh, :name_en, :name_jp, :code, :presence => true
  validates :code, :uniqueness => true
  validates :priority, :numericality => { :integer_only => true }
  
  symbolize :position, :in => [:top, :bottom, :top_and_bottom], :methods => true
  
  scope :top, where('position <> ?', 'bottom')
  scope :bottom, where('position <> ?', 'top')
  
  def page_title
    send("name_#{I18n.locale}")
  end
  
  def page_content
    send("content_#{I18n.locale}")
  end
  
  def to_param
    "#{code}"
  end
  
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
#  priority   :integer         default(0)
#  position   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

