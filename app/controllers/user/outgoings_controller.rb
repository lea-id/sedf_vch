#coding: utf-8

class User::OutgoingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @outgoings = Outgoing.by_user_id(current_user).order("created_at")
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outgoings }
    end
  end

  def show
    @outgoing = Outgoing.find(params[:id])
    @user = User.where(:id => @outgoing.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outgoing }
    end
  end
end
