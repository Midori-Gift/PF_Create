# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :reject_inactive_user, only: [:create]

  #   def reject_inactive_user
  #       @user = User.find_by(name: params[:user][:name])
  #     if @user
  #       if @user.valid_password?(params[:user][:password]) && !@user.is_delete
  #         redirect_to new_user_session_path
  #       end
  #     end
  #   end

  def after_sign_in_path_for(_resource)
    user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
