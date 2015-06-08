class ConsumptionsController < ActionController::Base
  

  def index
    @consumations = Consumption.all
  end

  def new
    @consumption = Consumption.new
    @user = User.find(params[:user_id])
    @drink = Drink.find(params[:drink_id])
  end

  def create
    binding.pry
    @Consumption = Consumption.create(params[:dink_id, :user_id].permit(:dink_id, :user_id))

   if consumption.save
      redirect_to consumptions_path
    else
      render 'new'
    end
  end

  
end

