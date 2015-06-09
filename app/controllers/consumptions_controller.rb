class ConsumptionsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @bac  = Consumption.calculate_bag(@user)
    @totalcalories = Consumption.calcutate_calories(@user)
    # @calories = Consumption.caculate_calories(@users)
  end

  def new
    @consumption = Consumption.new 
    @user = User.find(params[:user_id])
  end

  def create
   consumption = Consumption.create(drink_id: params[:consumption][:drink], user_id: params[:user_id])
   if consumption.save
      redirect_to user_consumptions_path
    else
      render 'new'
    end
  end

  def show  
  end 

end

