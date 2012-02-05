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
                  :remember_me,
                  :position,
                  :role_ids
                  
  validates :username,  :presence   => true,
                        :uniqueness => { :case_sensitive => false },
                        :length     => { :within => 4..20 },
                        :format     => { :with => /^[A-Za-z0-9_]+$/ }
  validates :name,      :presence   => true,
                        :length     => { :within => 4..30 }

  with_options dependent: :destroy do |user|
    user.has_many :events
    user.has_many :reports
    user.has_many :posts
  end
  
  has_and_belongs_to_many :roles
  
  symbolize :gender, :in => [:male, :female], :methods => true, :allow_nil => true
  
  scope :without_admin, where('is_admin <> true')
  
  before_save :email_nomarlisation
  
  def report_on_current_day
    reports.where('created_at > ?', Time.zone.now.change(:hour => 0)).last
  end
  
  def event_on_current_day
    events.where('created_at > ?', Time.zone.now.change(:hour => 0)).last
  end
  
  def checkin(checkin_time = Time.zone.now)
    return if has_checked_in?
    auto_checkout if events.present? && !!events.last.checkout_at
    
    events.create(:checkin_at => checkin_time)
  end
  
  def auto_checkout
    events.last.checkout(events.last.checkin_at.change(:hour => 18))
  end
  
  def checkout(checkout_time = Time.zone.now)
    events.last.update_attribute(:checkout_at, checkout_time) if events.present?
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
  
  def has_role?(role)
    roles.map(&:code).include?(role)
  end
  
  def can_manage_events?
    has_role?('event_admin') || is_admin?
  end
  
  def can_manage_reports?
    has_role?('report_admin') || is_admin?
  end
  
  def is_admin?
    !!is_admin || has_role?('administrator')
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
  
  private

  def email_nomarlisation
    self.email = email.strip.downcase
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

