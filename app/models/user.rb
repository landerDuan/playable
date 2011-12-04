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

  has_many :marks
  has_many :reports

end
