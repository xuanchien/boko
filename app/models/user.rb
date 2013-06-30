class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, :timeoutable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login
  attr_accessor :login
  validates :username, :presence => true

  has_and_belongs_to_many :roles
  has_many :adverts
  has_many :bids
  has_many :messages, :class_name => "BidMessage"
  
  ROLES = %w[admin user]
  
  scope :messages_by_bid_id, lambda{|bid_id|
    messages.where(:bid_id => bid_id)  
  }
  
  ##
  #Override the default authentication
  #allow to use email or username to login
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      where(conditions).first
    end
  end
  
  def admin?
    return has_role?("admin")
  end
  
  def has_role?(role)
    return roles.where(:name => role).count > 0
  end
  
  def has_bidded_on?(advert)
    return bids.where(:advert_id => advert.id).count > 0
  end
  
  ##
  #Get the bid that user has placed on an advert
  def bid_on(advert)
    bids.where(:advert_id => advert.id).first
  end
end
