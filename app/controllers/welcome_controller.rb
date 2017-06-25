class WelcomeController < ApplicationController

    #enum form_state: [:sign_in, :signup]
  
  def my_action
    @form_state = params[:form_state] || 'sign_up'
    redirect_to welcome_index_path(form_state: @form_state)
  end

  def index
    @form_state = params[:form_state] || 'sign_up'
    
  end

  def about
  end
  
  private
end
