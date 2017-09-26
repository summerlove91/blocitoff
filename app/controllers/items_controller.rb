class ItemsController < ApplicationController
  def index
    @items= Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Todo was saved."
      redirect_to users_show_path
    else
      flash.now[:alert] = "There was an error saving the todo. Please try again."
      render :new
    end
  end

  def destroy
     @item = current_user.items.find(params[:id])

     if @item.destroy
       flash[:notice] = "\"#{@item.name}\" was deleted successfully."
       redirect_to users_show_path
     else
       flash.now[:alert] = "There was an error deleting the item."
     end
  end

  private

  def item_params
    params.require(:item).permit(:name, :user)
  end
end
