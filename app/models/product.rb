class Product < ActiveRecord::Base
  attr_accessible :description, :location, :name, :original_price
end
