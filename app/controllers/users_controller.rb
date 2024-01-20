class UsersController < ApplicationController
  
  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
  end

  def new 
    @user = User.new
    end
    
  def create 
    @user = User.new(user_params)
    
    if @user.save 
      redirect_to @user
    else 
      render :new, status: :unprocessable_entity # the fields will be still filled out
    end
  end
  private 
    #strong parameters for safety
    def user_params 
      params.require(:user).permit(:name, :coordiantion, :telephone, :email, :company, :cooperator)
    end

end


