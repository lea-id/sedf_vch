#coding: utf-8

class IncomingsController < ApplicationController
  before_filter :authenticate_user!

  #load_and_authorize_resource

  # GET /incomings
  # GET /incomings.json
  def index
    @incomings = Incoming.where(:year_at => Date.current.year).order(:created_at)
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incomings }
    end
  end

  # GET /incomings/1
  # GET /incomings/1.json
  def show
    @incoming = Incoming.find(params[:id])
    @user = User.where(:id => @incoming.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incoming }
    end
  end

  # GET /incomings/new
  # GET /incomings/new.json
  def new
    @incoming = Incoming.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @incoming }
    end
  end

  # GET /incomings/1/edit
  def edit
    @incoming = Incoming.find(params[:id])
  end

  # POST /incomings
  # POST /incomings.json
  def create
    @incoming = Incoming.new(params[:incoming])
    @incoming.serial_no = Incoming.next_serial_no
    @incoming.year_at = Date.current.year

    respond_to do |format|
      if @incoming.save
        format.html { redirect_to @incoming, notice: 'Документ успешно создан.' }
        format.json { render json: @incoming, status: :created, location: @incoming }
      else
        format.html { render action: "new" }
        format.json { render json: @incoming.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /incomings/1
  # PUT /incomings/1.json
  def update
    @incoming = Incoming.find(params[:id])

    respond_to do |format|
      if @incoming.update_attributes(params[:incoming])
        format.html { redirect_to @incoming, notice: 'Документ успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incoming.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomings/1
  # DELETE /incomings/1.json
  def destroy
    @incoming = Incoming.find(params[:id])
    @incoming.destroy

    respond_to do |format|
      format.html { redirect_to incomings_url }
      format.json { head :no_content }
    end
  end

  def lookup
    incoming = Incoming.arel_table

    #if params[:subject] != ''
    #  @what_str = params[:subject]
    #else
    #  @what_str = 'what_str'
    #end

    @what_str = params[:subject].nil? ? 'what_str' : params[:subject]

    @lookups = Incoming.where(incoming[:description].matches("%"+"#{@what_str}"+"%").or(incoming[:address].matches("%"+"#{@what_str}"+"%")).or(incoming[:doc_no].matches("%"+"#{@what_str}"+"%")))
    @users = User.all
  end
end
