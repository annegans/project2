class ConsumptionsController < ApplicationController
  
  def index
    # @consumption = Consumption.find(params[:id])
    @user = User.find(params[:user_id])
    @bac  = Consumption.calculate_bag(@user)
    @totalcalories = Consumption.calculate_calories(@user)
    # @calories = Consumption.caculate_calories(@users)
    @consumption = Consumption.new 
    drinks_count =  @user.drinks.count
    @user = User.find(params[:user_id])
    @drunkLevel = Consumption.drunk_level(@bac)
    @drive = Consumption.drive(@bac)
    @drink_beer = @user.drinks.all.where(name:"beer")
    # @drink_type = @user.drinks.all.where(name:"")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: {bac: @bac, drinks_count: drinks_count, totalcalories: @totalcalories} }
    
    end

  end

  def new
    @consumption = Consumption.new 
    @user = User.find(params[:user_id])
  end

  def create
   
   @user = User.find(params[:user_id])
   consumption = Consumption.create(drink_id: params[:consumption][:drink], user_id: params[:user_id])
   @bac  = Consumption.calculate_bag(@user)
   drink_name = consumption.drink.name
   drinks_count =  @user.drinks.count
   drinks_calories =  Consumption.calculate_calories(@user)
   drinks_bac =  Consumption.calculate_bag(@user)
   drunk_level = Consumption.drunk_level(@bac)
   drive = Consumption.drive(@bac)
   
  respond_to do |format|
    if consumption.save
      format.html { redirect_to user_consumptions_path } 
      format.json { render json: {drink_name: drink_name, drinks_count: drinks_count, drinks_calories: drinks_calories, drinks_bac: drinks_bac, drunk_level: drunk_level, drive: drive},   status: :created }
    else
      format.html { render action: "new" }
      format.json { render json: consumption.errors, status: :unprocessable_entity }
    end
  end

  
  end

  def destroy
    consumption = Consumption.find(params[:id])
    consumption.destroy
    
    respond_to do |format|
      format.html  
      format.json { render json: { head: :no_content } }
    end
  end

  def show  
    @consumption = Consumption.find(params[:id])
  end 


end

 