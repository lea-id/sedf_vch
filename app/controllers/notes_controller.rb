#coding: utf-8

class NotesController < ApplicationController
  before_filter :authenticate_user!

  #load_and_authorize_resource

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.where(:year_at => Date.current.year).order(:created_at)
    @incomings = Incoming.where(:year_at => Date.current.year).order(:created_at)
    @user = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])
    @user = User.where(:id => @note.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notes }
    end
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])
    @note.serial_no = Note.next_serial_no
    @note.year_at = Date.current.year

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Документ успешно создан.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])


    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Документ успешно обновлен.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to incoming_notes_url }
      format.json { head :no_content }
    end
  end
end
