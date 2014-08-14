class CalculatorController < ApplicationController

  def new
  end

  def create
    @items          = params[:items].to_i
    @price_per_item = params[:price_per_item].to_i

    @total_amount = calculate_price
  end

  private

  def calculate_price
    (@items * @price_per_item) * 1.21
  end

end
