#coding: utf-8

class InternalsController < ApplicationController
  before_filter :authenticate_user!

  #load_and_authorize_resource

  # GET /users/1/internals
  # GET /users/1/internals.json
  def index
    @user = User.find(params[:user_id])
    @internals = @user.internals

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @internals }
    end
  end

  # GET /users/1/internals/1
  # GET /users/1/internals/1.json
  def show
    @user = User.find(params[:user_id])
    @internal = @user.nternals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @internal }
    end
  end

  # GET /users/1/internals/new
  # GET /users/1/internals/new.json
  def new
    @user = User.find(params[:user_id])
    @internal = @user.internals.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @internal }
    end
  end

  # GET /users/1/internals/1/edit
  def edit
    @user = User.find(params[:user_id])
    @internal = @user.internals.find(params[:id])
  end

  # POST /users/1/internals
  # POST /users/1/internals.json
  def create
    @user = User.find(params[:user_id])
    @internal = @user.internals.build(params[:users_internal])

    respond_to do |format|
      if @internal.save
        format.html { redirect_to @internal, notice: 'Документ успешно создан.' }
        format.json { render json: @internal, status: :created, location: @internal }
      else
        format.html { render action: "new" }
        format.json { render json: @internal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1/internals/1
  # PUT /users/1/internals/1.json
  def update
    @user = User.find(params[:user_id])
    @internal = @user.internals.find(params[:id])

    respond_to do |format|
      if @internal.update_attributes(params[:internal])
        format.html { redirect_to @internal, notice: 'Документ успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @internal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1/internals/1
  # DELETE /users/1/internals/1.json
  def destroy
    @user = User.find(params[:user_id])
    @internal = @user.internals.find(params[:id])
    @internal.destroy

    respond_to do |format|
      format.html { redirect_to users_internals_url }
      format.json { head :no_content }
    end
  end
end
