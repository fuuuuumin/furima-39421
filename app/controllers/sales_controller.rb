class SalesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @sale_address = SaleAddress.new
  end

end
