# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_categories

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_categories
    @categories = Category.all
  end

end
