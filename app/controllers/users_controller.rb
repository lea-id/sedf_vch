#coding: utf-8

class UsersController < ApplicationController
  before_filter :authenticate_user!

  #load_and_authorize_resource

  #before_filter :get_user, :only => [:index,:new,:edit]
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
  #load_and_authorize_resource :only => [:show,:new,:destroy,:edit,:update]

  # GET /users/1
  # GET /users/1.json
  def show
    # сделать текущего пользователя адмиристратором
    current_user.update_attribute :admin, true
    @user = User.find(params[:id])
    @title = @user.username
    #@user_internals = @user.user_internals.paginate(page: params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @title = "Настройки пользователя"
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = "Профиль обновлен."
        format.html { redirect_to @user, notice: 'Пользователь успешно обновлен.' }
        format.json { head :no_content }
      else
        @title = "Настройки пользователя"
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Get roles accessible by the current user
  def accessible_roles
    @accessible_roles = Role.accessible_by(current_ability,:read)
  end
 
  # Make the current user object available to views
  def get_user
    @current_user = current_user
  end
end
