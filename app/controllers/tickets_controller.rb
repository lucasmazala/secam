class TicketsController < ApplicationController
  
  # https://stackoverflow.com/questions/65897519/rails-devise-authenticate-either-two-models
  devise_group :users_type, contains: [:requester, :admin] # using group to authenticate two or more different models. Devise
  before_action :authenticate_users_type!   

  
  def index
    #@tickets = Ticket.all
    if current_admin
      @tickets =  Ticket.includes(:requester, :cooperators)
    else
      @tickets =  Ticket.includes(:requester, :cooperators).where('requester_id=?', current_requester) #Specify relationships to be included in the result set
    end  
  end

  
  def show
    @ticket = Ticket.find(params[:id])
  end


  def new
    @ticket = Ticket.new
    @ticket.cooperators.build # Instantiate a new Cooperator object associated with the @ticket object.  
  end

  def create 
    @ticket = Ticket.new(ticket_params)

    if @ticket.save 
      redirect_to @ticket, notice: "Ticket was successfully created"
    else 
      render :new, status: :unprocessable_entity 
    end
  end


  def edit 
    @ticket = Ticket.find(params[:id])
  end 

  def update 
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params) 
      redirect_to @ticket, notice: "Ticket was successfully updated" 
    else 
      render :edit, status: :unprocessable_entity
    end 
  end


  def destroy 
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    
    redirect_to tickets_path, notice: "Ticket was successfully destroyed"
  end

  private
  
    def ticket_params 
      params.require(:ticket).permit(:requester_id, :priority, :execution_date, :execution_time, :execution_place, :registered_by, 
                                    :ticket_purpose, :service_type, :observation, :service_progress, :ticket_situation, 
                                    :service_evaluation, :suggestions_complaints, cooperator_ids: []) #cooperator_ids: [] allows the ids passed indicating the cooperators. 
    end
end
