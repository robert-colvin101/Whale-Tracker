class WhalesController < ApplicationController
   def index
    @whales = Whale.all

  end

  def new
    @whale = Whale.new
  end

  def create
    @whale = Whale.new(gym_params)
    @whale.user = current_user
    if @whale.save
      redirect_to gym_path(@whale)
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
    redirect_to gym_path(@whale)
  end

  def destroy
    @whale.destroy
    redirect_to gyms_path
  end

  private

  def set_gym
    @whale = Whale.find(params[:id])
  end

  def gym_params
    params.require(:whale).permit(:profile, :name)
  end
end

