#coding: utf-8

class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @title = "Все пользователи"
    @users = User.paginate(:page => params[:page]).order("created_at")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @title = @user.username

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.order("name")
    @title = "Роли пользователя"
  end

  def update
    @user = User.find(params[:id])

    @user.roles.clear;
    selected_roles = params[:user][:role_ids].nil? ? [] : params[:user][:role_ids]
    selected_roles.each do |role|
      @user.add_role(Role.find_by_id(role))
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = "Профиль обновлен."
        format.html { redirect_to [:admin, @user], notice: 'Пользователь успешно обновлен.' }
        format.json { head :no_content }
      else
        @title = "Настройки пользователя"
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      flash[:success] = "Пользователь удален."
      format.html { redirect_to admin_users_url }
      #format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
