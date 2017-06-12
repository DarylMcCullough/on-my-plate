class WelcomeController < ApplicationController
  def index
    if current_user
      flash[:notice] = "I see that you're already signed in."
      redirect_to users_show_path
    end
    
  end

  def about
  end
end
