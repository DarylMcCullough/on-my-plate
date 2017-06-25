class WelcomeController < ApplicationController
  
    #enum form_state: [:sign_in, :signup]
  
  def my_action
    redirect_to welcome_index_path(form_state: 'sign_in')
  end

  def index
    @form_state = params[:form_state] || 'sign_up'
    
  end

  def about
  end
  
end
