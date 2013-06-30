class BidMessagesController < ApplicationController
  before_filter :authenticate_user!
  PAGE_SIZE = 20
  
  def index
    @bid = Bid.find(params[:bid_id])
    if !can?(:read, @bid)
      redirect_to root_path
    end
    @messages = @bid.bid_messages.order("created_at DESC").page(params[:page]).per_page(PAGE_SIZE)
    @bid_message = current_user.messages.new if @bid_message.nil?
  end
  
  #Create new message
  def create
    @bid = Bid.find(params[:bid_id])
    params[:bid_message][:price] = unmask(params[:bid_message][:price])
    @bid_message = @bid.bid_messages.new(params[:bid_message].merge(:sender => current_user))
    
    if @bid_message.save
      redirect_to bid_messages_path(@bid)
    else
      redirect_to :action => :index
    end 
  end
end
