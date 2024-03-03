class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  
  def show
    @ticket = Ticket.find(params[:id])
  end


  def new
    @ticket = Ticket.new
  end

  def create 
    @ticket = Ticket.new(ticket_params)

    if @ticket.save 
      redirect_to @ticket 
    else 
      render_to :new, status: :unprocessable_entity 
    end
  end


  def edit 
    @ticket = Ticket.find(params[:id])
  end 

  def update 
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params) 
      redirect_to @ticket 
    else 
      render_to :edit, status: :unprocessable_entity
    end 
  end


  def destroy 
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    
    redirect_to tickets_path, status: :see_other
  end

  private
  
    def ticket_params 
      params.require(@ticket).permit(:priority, :execution_date, :execution_time, :execution_place, :register_by, 
                                    :ticket_purpose, :service_type, :observation, :service_progress, :ticket_situation, 
                                    :service_evaluation, :suggestions_complaints, :requester_id)
    end
end
