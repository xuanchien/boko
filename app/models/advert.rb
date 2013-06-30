class Advert < ActiveRecord::Base
  attr_accessible :title, :description, :original_price
  validates_presence_of :title
  validates_presence_of :description
  belongs_to :user
  has_many :bids
  
end


