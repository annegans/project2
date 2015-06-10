
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  # def new
  #   @user = User.new
  # end

  # def create 
  #   @user = User.new(params.require(:user).permit(:name, :email, :password, :password_conformation))

  #   if @user.save
  #     redirect_to root_path, notice: 'signed up!'
  #   else
  #     render 'new'
  #   end
  # end

end