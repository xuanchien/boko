class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  def unmask(price)
    return price.gsub(/[,.]/, '')
  end
end
