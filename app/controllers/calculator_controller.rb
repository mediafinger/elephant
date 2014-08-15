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
    if sum >= 10.000
      sum * 0.9
    elsif sum >= 3000
      sum * 0.93
    elsif sum >= 1000
      sum * 0.95
    elsif sum > 500
      sum * 0.97
    elsif sum > 100
      sum * 0.98
    end
  end

  def set_tax(cc)
    case cc.to_s.downcase
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
      raise "This country code is not supported"  # TODO handle exception
    end
  end

end
