class ThingsController < ApplicationController
  before_action :set_thing, only: [:edit, :show]

  def index
    @things = Thing.includes(:user).order('created_at DESC')
  end

  def new
    @thing = ThingTag.new
  end

  def create
    @thing =  ThingTag.new(thing_params)
    if @thing.save
      redirect_to root_path(@thing)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @thing.comments.includes(:user).order('created_at DESC')
  end

  def destroy
    thing = Thing.find(params[:id])
    thing.destroy
    redirect_to root_path
  end

  def edit
    @thing = Thing.find(params[:id])
  end

  def update
    @thing = Thing.find(params[:id])
    if @thing.update(thing_params)
      redirect_to root_path(@thing)
    else
      render :edit
    end
  end

  private

  def thing_params
    params.require(:thing_tag).permit(:name, :explanation, :score, :date, :price, :tagname, :image).merge(user_id: current_user.id)
  end

  def set_thing
    @thing = Thing.find(params[:id])
  end

end
