class SalesController < ApplicationController

  def index
    @sale_address = SaleAddress.new
  end

end
