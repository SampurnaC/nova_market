class ListingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @listings = Listing.all
  end

  def new
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private
    def listing_params
      params.require(:listing).permit(:title, :description, :price, :quantity, :status)
    end

end
