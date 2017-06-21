class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.user = current_user


     if @item.save
       puts "saving"
       redirect_to users_show_path, notice: "Item was saved successfully."
     else
       flash.now[:alert] = "Error creating item. Please try again."
       render :new
     end

   end
   
   def destroy
     item = Item.find(params[:id])

     if item.destroy
       flash[:notice] = "Item was deleted."
       redirect_to root_path
     else
       flash[:alert] = "Comment couldn't be deleted. Try again."
       redirect_to root_path
     end
   end
   
   
   private
   
    def item_params
      params.require(:item).permit(:name)
    end
 end