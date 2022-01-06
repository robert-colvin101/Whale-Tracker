class WhalesController < ApplicationController
   def index
    @whales = Whale.all

  end

  def new
    @whale = Whale.new
  end

  def create
    @whale = Whale.new(whale_params)
    if @whale.save
      redirect_to whale_path(@whale)
    else
      render :new
    end
  end

  def show
    @whale = Whale.find(params[:id])
  end

  def edit
  end

  def update
    @whale.update(gym_params)
    redirect_to whale_path(@whale)
  end

  def destroy
    @whale.destroy
    redirect_to whale_path
  end

  private

  def set_whale
    @whale = Whale.find(params[:id])
  end

  def whale_params
    params.require(:whale).permit(:profile, :name)
  end
end

