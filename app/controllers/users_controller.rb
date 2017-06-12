class UsersController < ApplicationController
  def show
      if ! current_user
      flash[:notice] = "You must be signed in to see this page."
      redirect_to welcome_index_path
    end
    @user = current_user
  end
end
