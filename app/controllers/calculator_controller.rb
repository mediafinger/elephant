class CalculatorController < ApplicationController

  def new
  end

  def create
    @items          = params[:items].to_i
    @price_per_item = params[:price_per_item].to_i

    @tax            = set_tax(params[:cc])

    @total_amount = calculate_price
  end

  private

  def calculate_price
    grant_discount(@items * @price_per_item) * (1 + @tax.to_f/100)
  end

  def grant_discount(sum)
    if sum > 100
      sum * 0.98
    else
      sum
    end
  end

  def set_tax(cc)
    case cc
    when "es"
      21
    when "de"
      19
    when "fr"
      12
    when "no"
      35
    when "it"
      20
    else
      0
    end
  end

end
