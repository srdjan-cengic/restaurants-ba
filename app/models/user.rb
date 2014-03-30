class User < ActiveRecord::Base
  
  #protected attributes
  attr_accessible :cached_failed_attempts

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :favourites

  def self.logins_before_captcha
    5
  end

end
