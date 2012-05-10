#coding: utf-8

class ExecutionsController < ApplicationController
  before_filter :authenticate_user!

  #load_and_authorize_resource

  # GET /executions
  # GET /executions.json
  def index
    @executions = Execution.where(:year_at => Date.current.year).order(:execute_to)
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @executions }
    end
  end

  # GET /executions/1
  # GET /executions/1/.json
  def show
    @execution = Execution.find(params[:id])
    @user = User.where(:id => @execution.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @execution }
    end
  end

  # GET /executions/new
  # GET /executions/new.json
  def new
    @execution = Execution.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @execution }
    end
  end

  # GET /executions/1/edit
  def edit
    @execution = Execution.find(params[:id])
  end

  # POST /executions
  # POST /executions.json
  def create
    @execution = Execution.new(params[:execution])
    @execution.serial_no = Execution.next_serial_no
    @execution.year_at = Date.current.year
    
    respond_to do |format|
      if @execution.save
        format.html { redirect_to @execution, notice: 'Документ успешно создан.' }
        format.json { render json: @execution, status: :created, location: @execution }
      else
        format.html { render action: "new" }
        format.json { render json: @execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /executions/1
  # PUT /executions/1.json
  def update
    @execution = Execution.find(params[:id])

    respond_to do |format|
      if @execution.update_attributes(params[:execution])
        format.html { redirect_to @execution, notice: 'Документ успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @execution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /executions/1
  # DELETE /executions/1.json
  def destroy
    @execution = Execution.find(params[:id])
    @execution.destroy

    respond_to do |format|
      format.html { redirect_to executions_url }
      format.json { head :no_content }
    end
  end
end
