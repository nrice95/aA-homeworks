class BandsController < ApplicationController

  def new
    render :new
  end

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to user_url(current_user)
    end

  end

  def index

  end

  def edit

  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update

  end

  def destroy

  end

  def band_params
    params.require(:band).permit(:name)
  end

end
