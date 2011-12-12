class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable,
          :confirmable,
          :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username,
                  :email,
                  :password,
                  :password_confirmation,
                  :remember_me

  has_many :events
  has_many :reports
  has_and_belongs_to_many :groups
  has_many :posts
  
  symbolize :gender, :in => [:male, :female], :methods => true, :allow_nil => true

  def confirmation_required?
    false
  end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  username               :string(255)
#  name                   :string(255)
#  phone                  :string(255)
#  birthdate              :datetime
#  gender                 :string(255)
#  bio                    :text
#  is_admin               :boolean         default(FALSE)
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  password_salt          :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  authentication_token   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

