class SalesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @sale_address = SaleAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @sale_address = SaleAddress.new(sale_params)
    if @sale_address.valid?
      @sale_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sale_params
    params.require(:sale_address).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
