class Post < ActiveRecord::Base
  acts_as_taggable
  
  attr_readonly :comments_count

  validates :title, :permalink, :category_id,	:presence => true

  has_many :comments
  
  belongs_to :category, :counter_cache => true
  belongs_to :user,     :counter_cache => true
  
  scope :default_order, order('created_at DESC')
  scope :the_latest_ten_posts, default_order.limit(10)
end

# == Schema Information
#
# Table name: posts
#
#  id             :integer         not null, primary key
#  user_id        :integer
#  title          :string(255)
#  permalink      :string(255)
#  content        :text
#  is_top         :boolean
#  category_id    :integer
#  comments_count :integer         default(0)
#  created_at     :datetime
#  updated_at     :datetime
#

