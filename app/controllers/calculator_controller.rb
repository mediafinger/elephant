class CalculatorController < ApplicationController

  def new
  end

  def create
    @items = params[:items]
  end

end
