#coding: utf-8

class User::NotesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @notes = Note.where(:user_id => current_user).order(:created_at)
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outgoings }
    end
  end

  def show
    @note = Notes.find(params[:id])
    @user = User.where(:id => @note.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outgoing }
    end
  end
end
