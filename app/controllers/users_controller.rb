# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :posts]
  before_action :true_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @users = @user.favorites.page(params[:page]).per(8).order('updated_at DESC')
    @greats = Great.all
  end

  # ユーザーの編集にリンクへの直接入力で入ろうとした場合の振るい分け

  def true_user
    @user = User.find(params[:id])
    if current_user.id == @user.id
    elsif current_user.admin?
    else
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  def posts
    @user = User.find(params[:id])
    @greats = Great.where(is_release: true)
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  # ユーザーの論理削除用

  def hide
    @users = current_user
    @user = User.find(params[:id])
    if @user.is_delete == false
      @user.update(is_delete: true)
    else
      @user.update(is_delete: false)
    end
    if current_user.admin?
      redirect_to admin_users_path
    else
      reset_session
      redirect_to root_path
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :name, :email)
  end
end
