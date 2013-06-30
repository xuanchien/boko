class BidsController < ApplicationController
  before_filter :authenticate_user!
  ##
  #Display all bid messages for a particular user on particular advert
  def index
    @advert = Advert.find(params[:advert_id])
    @bids = @advert.bids
  end
  def new 
    @advert = Advert.find(params[:advert_id])
    @bid = @advert.bids.new
  end
  
  def create
    @advert = Advert.find(params[:advert_id])
    if can? :bid, @advert
      @bid = current_user.bids.new(:advert => @advert)
      @bid_message = @bid.bid_messages.new(:price => params[:price], :message => params[:message], 
        :sender => current_user)
      if @bid.save
        render :json => {:status => 'ok'}
      else
        render :json => {:status => 'nok', :errors => @bid.errors.full_messages}
      end
    else
      render :json => {:message => t("unauthorized.already_bidded")}, :status => :unauthorized    
    end
  end
  
  def show 
    @bid = Bid.find(params[:id])
    @bid_messages = @bid.bid_messages
  end
  
  def update
    @bid = Bid.find(params[:id])
    if @bid.update_attributes(params[:bid])
      redirect_to advert_path(@bid.advert)
    else
      render :show, :id => params[:id]
    end
  end
end
