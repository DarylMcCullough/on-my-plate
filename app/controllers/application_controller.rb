class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_filter :load_form_state
  after_filter :save_form_state
  
  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs

  end
  
  def load_form_state
    @form_state = session[:form_state] || 'sign_up'
  end

  def save_form_state
    session[:form_state] = @form_state
  end
  
  private
  

  
end
