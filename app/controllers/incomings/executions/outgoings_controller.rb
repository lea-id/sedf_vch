#coding: utf-8

class Incomings::Executions::OutgoingsController < ApplicationController
  before_filter :authenticate_user!

  # GET /outgoings
  # GET /outgoings.json
  def index
    @incoming = Incoming.find(params[:incoming_id])
    @execution = @incoming.executions.find(params[:execution_id])
    @outgoings = @execution.outgoings
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outgoings }
    end
  end

  # GET /outgoings/1
  # GET /outgoings/1.json
  def show
    @incoming = Incoming.find(params[:incoming_id])
    @execution = @incoming.executions.find(params[:execution_id])
    @outgoing = @execution.outgoings.find(params[:id])
    @user = User.where(:id => @outgoing.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outgoing }
    end
  end

  # GET /outgoings/new
  # GET /outgoings/new.json
  def new
    @incoming = Incoming.find(params[:incoming_id])
    @execution = @incoming.executions.find(params[:execution_id])
    @outgoing = @execution.outgoings.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outgoing }
    end
  end

  # GET /outgoings/1/edit
  def edit
    @incoming = Incoming.find(params[:incoming_id])
    @execution = @incoming.executions.find(params[:execution_id])
    @outgoing = @execution.outgoings.find(params[:id])
  end

  # POST /outgoings
  # POST /outgoings.json
  def create
    @incoming = Incoming.find(params[:incoming_id])
    @execution = @incoming.executions.find(params[:execution_id])
    @outgoing = @execution.outgoings.build(params[:outgoing])
    @outgoing.in_out_no = @incoming.serial_no
    @outgoing.user_id = @incoming.user_id
    @outgoing.serial_no = Outgoing.next_serial_no
    @outgoing.year_at = Date.current.year

    respond_to do |format|
      if @outgoing.save
        @new_outgoing = @execution.outgoings.find(@outgoing.id)
        Incoming.find(params[:incoming_id]).update_attributes(:in_out_no => @new_outgoing.serial_no)
        Execution.find(params[:execution_id]).update_attributes(:data_control => @outgoing.data_control, :done => @outgoing.done)
        format.html { redirect_to incoming_execution_outgoing_url(@incoming, @execution, @outgoing), notice: 'Документ успешно создан.' }
        format.json { render json: @outgoing, status: :created, location: @outgoing }
      else
        format.html { render action: "new" }
        format.json { render json: @outgoing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /outgoings/1
  # PUT /outgoings/1.json
  def update
    @incoming = Incoming.find(params[:incoming_id])
    @execution = @incoming.executions.find(params[:execution_id])
    @outgoing = @execution.outgoings.find(params[:id])

    respond_to do |format|
      if @outgoing.update_attributes(params[:outgoing])
        format.html { redirect_to incoming_outgoing_url(@incoming, @outgoing), notice: 'Документ успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @outgoing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outgoings/1
  # DELETE /outgoings/1.json
  def destroy
    @incoming = Incoming.find(params[:incoming_id])
    @execution = @incoming.executions.find(params[:execution_id])
    @outgoing = @execution.outgoings.find(params[:id])
    @outgoing.destroy
    #Incoming.find(params[:incoming_id]).update_attributes(:in_out_no => nil)
    #Execution.find(params[:execution_id]).update_attributes(:data_control => nil, :done => nil)
    @incoming.update_attributes(:in_out_no => nil)
    @execution.update_attributes(:data_control => nil, :done => nil)

    respond_to do |format|
      format.html { redirect_to incoming_execution_outgoings_url(@incoming, @execution) }
      format.json { head :no_content }
    end
  end
end
