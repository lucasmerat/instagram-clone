# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def user_liked
    post.likes.map {|like| like.account_id}.include?(current_account.id)
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username first_name last_name email password])
  end
end
