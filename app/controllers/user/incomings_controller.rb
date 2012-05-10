#coding: utf-8

class User::IncomingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @incomings = Incoming.by_user_id(current_user).order("created_at")
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incomings }
    end
  end

  def show
    @incoming = Incoming.find(params[:id])
    @user = User.where(:id => @incoming.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incoming }
    end
  end
end
