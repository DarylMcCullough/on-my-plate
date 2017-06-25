class ItemsController < ApplicationController

    def create
        @item = Item.new(item_params)
        @item.user = current_user

        if @item.save
            flash[:notice] = "Item was saved successfully."
            redirect_to root_path
        else
            flash[:alert] = "Error creating item. Please try again."
            redirect_to root_path
        end
    end
   
   def destroy
     item = Item.find(params[:id])
     # from https://www.tutorialspoint.com/ruby-on-rails/rails-and-ajax.htm
     if item.destroy
        flash[:notice] = "Item was deleted."
        respond_to do |format|
            format.html { redirect_to ponies_url }
            format.json { head :no_content }
            format.js   { render :layout => false }
        end
     else
       flash[:alert] = "Item couldn't be deleted. Try again."
     end
   end
   
   
   private
   
    def item_params
      params.require(:item).permit(:name)
    end
end