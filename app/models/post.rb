class Post < ActiveRecord::Base
  acts_as_taggable
  
  attr_readonly :comments_count

  # validates :name, :presence => true, :uniqueness => true
  validates :title, :permalink, :content, :category_id,  :presence   => true

  has_many :comments
  
  belongs_to :category, :counter_cache => true
  belongs_to :user,     :counter_cache => true
  
  scope :by_join_date, order('created_at DESC')
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

