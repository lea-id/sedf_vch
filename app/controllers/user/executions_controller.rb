#coding: utf-8

class User::ExecutionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @executions = Execution.where(:user_id => current_user).order(:execute_to)
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @executions }
    end
  end

  def show
    @execution = Execution.find(params[:id])
    @user = User.where(:id => @execution.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @execution }
    end
  end
end
