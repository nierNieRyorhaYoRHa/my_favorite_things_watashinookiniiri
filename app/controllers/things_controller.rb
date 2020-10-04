class ThingsController < ApplicationController
  before_action :set_thing, only: [:edit, :show]

  def index
    @things = Thing.includes(:user).order('created_at DESC')
  end

  def new
    @thing = Thing.new
  end

  def create
    @thing =  Thing.new(thing_params)
    if @thing.save
      redirect_to root_path(@thing)
    else
      render :new
    end
  end


  def destroy
    thing = Thing.find(params[:id])
    thing.destroy
    redirect_to root_path
  end


  private

  def thing_params
    params.require(:thing).permit(:name, :explanation, :score, :date, :price, :image).merge(user_id: current_user.id)
  end

  def set_thing
    @thing = Thing.find(params[:id])
  end

end
