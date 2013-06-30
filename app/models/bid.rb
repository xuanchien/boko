class Bid < ActiveRecord::Base
  attr_accessible :user, :advert
  
  belongs_to :user
  belongs_to :advert
  
  has_many :bid_messages
end
