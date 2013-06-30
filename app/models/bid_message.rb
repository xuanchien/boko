class BidMessage < ActiveRecord::Base
  belongs_to :bid
  belongs_to :sender, :class_name => "User", :foreign_key => "user_id"
  attr_accessible :price, :message, :sender, :bid
  validates :message, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0}, :allow_blank => true
end
