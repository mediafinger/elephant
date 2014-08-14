class CalculatorController < ApplicationController

  def new
  end

  def create
    @items          = params[:items].to_i
    @price_per_item = params[:price_per_item].to_i

    @total_amount = @items * @price_per_item
  end

end
