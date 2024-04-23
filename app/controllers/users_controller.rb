class UsersController < ApplicationController

  # https://stackoverflow.com/questions/65897519/rails-devise-authenticate-either-two-models
  devise_group :user_requester, contains: [:user, :requester] # using group to authenticate two or more different models. Devise
  before_action :authenticate_user_requester!   
  
  
  def index
    @users = User.all #fethces all kinds of Users 
    #@users = User.where(:type => params[:type]) #fetches all users of a specific type.  
  end


  def show
    @user = User.find(params[:id])
  end

  
  def new 
    @user = User.new
    @user.type = params[:type]      
  end
    
  def create 
    @user = User.new(user_params)
    #@user = current_user(user_params) #using devise
            
    if @user.save 
      #redirect_to action: "index", notice: "User was successfully created" # if we want to go straight to all users 
      redirect_to @user, notice: "User was successfully created"
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
      redirect_to @user, notice: "User was successfully updated"
    else 
      render :edit, status: :unprocessable_entity
    end 
  end


  def destroy 
    @user = User.find(params[:id])
    @user.destroy 

    redirect_to users_path, notice: "User was successfully destroyed"
  end

  private 
    #strong parameters for safety
    def user_params 
      params.require(:user).permit(:name, :coordination, :telephone, :email, :company, :type)
    end

end


