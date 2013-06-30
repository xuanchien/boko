class AdvertsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  MY_ADVERTS = 1
  PAGE_SIZE = 8
  
  def index
    if params[:filter] == MY_ADVERTS.to_s
      @adverts = current_user.adverts
    else
      @adverts = Advert
      @adverts = @adverts.where("user_id <> ?", current_user.id) if current_user
    end 
    search = params[:search] || ""
     
    @adverts = @adverts.includes(:bids).order("created_at DESC")
      .page(params[:page]).per_page(PAGE_SIZE)
    
  end
  
  ##
  #Create a new advert
  def new
    @advert = Advert.new
  end
  
  def edit
    @advert = Advert.find(params[:id])
  end
  
  def update
    @advert = Advert.find(params[:id])
    @advert.update_attributes(params[:advert])
    
    redirect_to advert_path(@advert)
  end
  
  def show 
    @advert = Advert.find(params[:id])
  end
  
  def create
    #remove masking on original_price
    price = params[:advert][:original_price]
    params[:advert][:original_price] = unmask(price)
    @advert = current_user.adverts.new(params[:advert])
    if @advert.save
      redirect_to :action => :index, :filter => MY_ADVERTS
    else
      render :new     
    end
  end
  
  def destroy
    @advert = Advert.find(params[:id])
    @advert.destroy
    respond_to do |format|
      format.html{
        redirect_to :action => :index, :filter => MY_ADVERTS    
      }
      format.json{
        render :json => {:status => STATUS_OK, :advert => @advert}
      }
    end
    
  end
  
end
