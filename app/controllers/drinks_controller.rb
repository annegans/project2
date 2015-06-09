class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def new 
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drinks_params)
  end

  private
    def drinks_params
      params.require(:drink).permit(:drink_id) 
    end
end