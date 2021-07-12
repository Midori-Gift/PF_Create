class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  def index
    @users = User.page(params[:page]).reverse_order
  end
  
  def if_not_admin
      redirect_to root_path unless current_user.admin?
  end
end
