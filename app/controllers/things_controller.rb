class ThingsController < ApplicationController
  def index
    @things = Thing.all
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

  def thing_params
    params.require(:thing).permit(:name, :explanation, :score, :date, :price, :image).merge(user_id: current_user.id)
  end

end
