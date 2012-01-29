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
          
  
  attr_readonly :events_count, :reports_count, :posts_count

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username,
                  :name,
                  :phone,
                  :birthdate,
                  :gender,
                  :bio,
                  :email,
                  :password,
                  :password_confirmation,
                  :remember_me
                  
  validates :username,  :presence   => true,
                        :uniqueness => true

  has_many :events
  has_many :reports
  has_many :posts
  has_many :role_users
  has_many :roles, :through => :role_users
  
  symbolize :gender, :in => [:male, :female], :methods => true, :allow_nil => true
  
  scope :without_admin, where('is_admin <> true')
  
  def checkin
    if already_checked_in?
      return
    else
      if events.present? && !events.last.checkout_at.present?
        @last_checkout_time = Time.zone.parse(events.last.checkin_at.to_s).change(:hour => 18)
        events.last.update_attribute(:checkout_at, @last_checkout_time)
      end
      events.create(:checkin_at => Time.zone.now)
    end
  end
  
  def checkout
    events.last.update_attribute(:checkout_at, Time.zone.now) if events.present?
  end
  
  def has_checked_in?
    events.last.checkin_at > Time.zone.now.change(:hour => 6) if events.present?
  end
  
  def has_checked_out?
    events.present? && events.last.checkout_at
  end
  
  def has_reported?
    reports.on_today.present?
  end
  
  def notifiers
    notifiers = {}
    notifiers.merge!(:should_checkin => true) unless has_checked_in?
    notifiers.merge!(:should_report => true) unless has_reported?
    notifiers.merge!(:should_checkout => true) if has_checked_in? && !has_checked_out?
    
    notifiers
  end
  
  # Devise overrides
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
#  position               :string(255)
#  bio                    :text
#  is_admin               :boolean         default(FALSE)
#  events_count           :integer         default(0)
#  reports_count          :integer         default(0)
#  posts_count            :integer         default(0)
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

