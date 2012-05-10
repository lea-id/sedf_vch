#coding: utf-8

class Incomings::ExecutionsController < ApplicationController
  before_filter :authenticate_user!

  # GET /incomings/1/executions
  def index
    # For URL like /incomings/1/executions
    # Get the incoming with id=1
    @incoming = Incoming.find(params[:incoming_id])

    # Access all executions for that incoming
    @executions = @incoming.executions
    @user = User.all
  end

  # GET /incomings/1/executions/2
  def show
    @incoming = Incoming.find(params[:incoming_id])

    # For URL like /incomings/1/executions/2
    # Find an execution in incomings 1 that has id=2
    @execution = @incoming.executions.find(params[:id])
    @user = User.where(:id => @execution.user_id)
  end

  # GET /incomings/1/executions/new
  def new
    @incoming = Incoming.find(params[:incoming_id])

    # Associate an execution object with incoming 1
    @execution = @incoming.executions.build
  end

  # POST /incomings/1/executions
  def create
    @incoming = Incoming.find(params[:incoming_id])

    # For URL like /incomings/1/executions
    # Populate an execution associate with incoming 1 with form data
    # incoming will be associated with the execution
    @execution = @incoming.executions.build(params[:execution])
    @execution.serial_no = Execution.next_serial_no
    @execution.year_at = Date.current.year
    #@incoming.user_id = @execution.user_id
    
    if @execution.save
      # Save the execution successfully
      @new_execution = @incoming.executions.find(@execution.id)
      Incoming.find(params[:incoming_id]).update_attributes(:user_id => @new_execution.user_id)
      redirect_to incoming_execution_url(@incoming, @execution)
    else
      render :action => "new"
    end
  end

  # GET /incomings/1/executions/2/edit
  def edit
    @incoming = Incoming.find(params[:in_id])

    # For URL like /incomings/1/executions/2/edit
    # Get execution id=2 for incoming 1
    @execution = @incoming.executions.find(params[:id])
  end

  # PUT /incomings/1/executions/2
  def update
    @incoming = Incoming.find(params[:incoming_id])
    @execution = Execution.find(params[:id])
    #@execution = @incoming.executions.find(params[:id])
    if @execution.update_attributes(params[:execution])
      # Save the execution successfully
      redirect_to incoming_execution_url(@incoming, @execution)
    else
      render :action => "edit"
    end
  end

  # DELETE /incomings/1/executions/2
  def destroy
    @incoming = Incoming.find(params[:incoming_id])
    @execution = Execution.find(params[:id])
    #@execution = @incoming.executions.find(params[:id])
    @execution.destroy

    respond_to do |format|
      format.html { redirect_to incoming_executions_path(@incoming) }
      format.xml  { head :ok }
    end
  end
end
