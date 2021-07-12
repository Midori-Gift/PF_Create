class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @greats = Great.all
  end

  def edit
    @user = User.find(params[:id])
    # if @user.update
    # else
    #   render 'edit'
    # end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def posts
    @user = User.find(params[:id])
    @greats = @user.greats
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_delete: true)
    reset_session
    redirect_to root_path
  end

  def update
    user = User.find(params[:id])

    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :email)
  end
end
