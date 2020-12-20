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
    @things = ThingTag.new
    @thing = Thing.find(params[:id])
  end

  def update
    binding.pry
    @thing =  ThingTag.new(thing_params)
    @thing.thing_id = params[:id]
    if @thing.update(thing_params)
      redirect_to root_path(@thing)
    else
      redirect_to edit_thing_path(params[:id])
    end
  end

  def search
    return nil if params[:input] == ''
    tag = Tag.where(['tagname LIKE ?', "%#{params[:input]}%"])
    render json: { keyword: tag }
  end

  def things_search
    @things = Thing.search(params[:keyword]).includes(:user).order('created_at DESC')
  end

  private

  def thing_params
    params.require(:thing_tag).permit(:name, :explanation, :score, :date, :price, :tagname, :image).merge(user_id: current_user.id)
  end

  def set_thing
    @thing = Thing.find(params[:id])
  end

end
