class ThingsController < ApplicationController
  before_action :set_thing, only: [:edit, :show]
  before_action :move_to_sign_in, except: [:index, :show, :search, :things_search]

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
    @tagid = ThingTagRelation.find_by(thing_id: @thing.id)
    @tag = Tag.find_by(id: @tagid.tag_id)
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

  def move_to_sign_in
    redirect_to user_session_path unless user_signed_in?
  end

  def thing_params
    params.require(:thing_tag).permit(:name, :explanation, :score, :date, :price, :tagname, :image).merge(user_id: current_user.id)
  end

  def set_thing
    @thing = Thing.find(params[:id])
  end

end
