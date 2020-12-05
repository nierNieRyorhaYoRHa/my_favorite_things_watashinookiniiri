class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @user = User.find(params[:id])
    @things = user.things
  end


  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user)
      redirect_to root_path and return
    else
      render :edit and return 
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname, :birthday)
  end

end
