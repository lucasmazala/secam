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


  def edit # Fetches the user from the db and saves it in @user.    
    @user = User.find(params[:id])
  end

  def update # fill out the form with data and try to save. Similar thing occurs in create 
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user 
    else 
      render :edit, status: :unprocessable_entity
    end 
  end


  def destroy 
    @user = User.find(params[:id])
    @user.destroy 

    redirect_to root_path, status: :see_other
  end

  private 
    #strong parameters for safety
    def user_params 
      params.require(:user).permit(:name, :coordination, :telephone, :email, :company, :cooperator)
    end

end


