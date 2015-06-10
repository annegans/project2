class ConsumptionsController < ApplicationController
  
  def index
    # @consumption = Consumption.find(params[:id])
    @user = User.find(params[:user_id])
    @bac  = Consumption.calculate_bag(@user)
    @totalcalories = Consumption.calcutate_calories(@user)
    # @calories = Consumption.caculate_calories(@users)
    @consumption = Consumption.new 
    @user = User.find(params[:user_id])
    @drunkLevel = Consumption.drunk_level(@bac)
    @drive = Consumption.drive(@bac)
  end

  def new
    @consumption = Consumption.new 
    @user = User.find(params[:user_id])
  end

  def create
   consumption = Consumption.create(drink_id: params[:consumption][:drink], user_id: params[:user_id])
   drink_name = consumption.drink.name
   drinks_count =  User.find(params[:user_id]).drinks.count

   
  respond_to do |format|
    if consumption.save
      format.html {redirect_to user_consumptions_path}
      format.json { render json: {drink_name: drink_name, drinks_count: drinks_count } , status: :created }

    else
      format.html { render action: "new" }
      format.json { render json: consumption.errors, status: :unprocessable_entity }
    end
  end

  
  end

  def destroy
    @consumption = Consumption.find(params[:id])
    @consumption.destroy
    redirect_to user_consumptions_path
  end

  def show  
    @consumption = Consumption.find(params[:id])
  end 



end

  # index view
  # <%= button_to('Delete Planet', planet_path(planet), method: :delete, data: {confirm: 'Energise the demolition beam?'} ) %>