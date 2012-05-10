#coding: utf-8

class OutgoingsController < ApplicationController
  before_filter :authenticate_user!

  #load_and_authorize_resource

  # GET /outgoings
  # GET /outgoings.json
  def index
    @outgoings = Outgoing.where(:year_at => Date.current.year).order(:created_at)
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outgoings }
    end
  end

  # GET /outgoings/1
  # GET /outgoings/1.json
  def show
    @outgoing = Outgoing.find(params[:id])
    @user = User.where(:id => @outgoing.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outgoing }
    end
  end

  # GET /outgoings/new
  # GET /outgoings/new.json
  def new
    @outgoing = Outgoing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outgoing }
    end
  end

  # GET /outgoings/1/edit
  def edit
    @outgoing = Outgoing.find(params[:id])
  end

  # POST /outgoings
  # POST /outgoings.json
  def create
    @outgoing = Outgoing.new(params[:outgoing])
    @outgoing.serial_no = Outgoing.next_serial_no
    @outgoing.year_at = Date.current.year
    @outgoing.data_control = "data_control"
    @outgoing.done = "done"

    respond_to do |format|
      if @outgoing.save
        format.html { redirect_to @outgoing, notice: 'Документ успешно создан.' }
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
    @outgoing = Outgoing.find(params[:id])
    @outgoing.data_control = "data_control"
    @outgoing.done = "done"

    respond_to do |format|
      if @outgoing.update_attributes(params[:outgoing])
        format.html { redirect_to @outgoing, notice: 'Документ успешно обновлен.' }
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
    @outgoing = Outgoing.find(params[:id])
    @outgoing.destroy

    respond_to do |format|
      format.html { redirect_to outgoings_url }
      format.json { head :no_content }
    end
  end

  def lookup
    outgoing = Outgoing.arel_table

    #if params[:subject] != ''
    #  @what_str = params[:subject]
    #else
    #  @what_str = 'what_str'
    #end

    @what_str = params[:subject].nil? ? 'what_str' : params[:subject]

    @lookups = Outgoing.where(outgoing[:description].matches("%"+"#{@what_str}"+"%").or(outgoing[:address].matches("%"+"#{@what_str}"+"%")).or(incoming[:in_out_no].matches("%"+"#{@what_str}"+"%")))
    @users = User.all
  end
end
