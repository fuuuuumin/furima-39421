class SalesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @sale_address = SaleAddress.new
    return unless (current_user == @item.user || Sale.exists?(item_id: @item.id))
    redirect_to root_path
  end

  def create
    @item = Item.find(params[:item_id])
    @sale_address = SaleAddress.new(sale_params)
    if @sale_address.valid?
      pay_item
      @sale_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sale_params
    params.require(:sale_address).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: sale_params[:token],
      currency: 'jpy'
    )
  end

end
