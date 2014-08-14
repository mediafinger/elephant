class CalculatorController < ApplicationController

  def new
  end

  def create
    @items          = params[:items]
    @price_per_item = params[:price_per_item]
  end

end
