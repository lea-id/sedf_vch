#coding: utf-8

class Incomings::NotesController < ApplicationController
  before_filter :authenticate_user!

  # GET /incomings/1/notes
  def index
    # For URL like /incomings/1/notes
    # Get the incoming with id=1
    @incoming = Incoming.find(params[:incoming_id])

    # Access all notes for that incoming
    @notes = @incoming.notes
    @user = User.all
  end

  # GET /incomings/1/notes/2
  def show
    @incoming = Incoming.find(params[:incoming_id])

    # For URL like /incomings/1/notes/2
    # Find an note in incomings 1 that has id=2
    @note = @incoming.notes.find(params[:id])
    @user = User.where(:id => @note.user_id)
  end

  # GET /incomings/1/notes/new
  def new
    @incoming = Incoming.find(params[:incoming_id])

    # Associate an note object with incoming 1
    @note = @incoming.notes.build
  end

  # POST /incomings/1/notes
  def create
    @incoming = Incoming.find(params[:incoming_id])

    # For URL like /incomings/1/notes
    # Populate an note associate with incoming 1 with form data
    # incoming will be associated with the note
    @note = @incoming.notes.build(params[:note])
    @note.serial_no = Note.next_serial_no
    @note.year_at = Date.current.year

    if @note.save
      # Save the note successfully
      redirect_to incoming_note_url(@incoming, @note)
    else
      render :action => "new"
    end
  end

  # GET /incomings/1/notes/2/edit
  def edit
    @incoming = Incoming.find(params[:incoming_id])

    # For URL like /incomings/1/notes/2/edit
    # Get note id=2 for incoming 1
    @note = @incoming.notes.find(params[:id])
  end

  # PUT /incomings/1/notes/2
  def update
    @incoming = Incoming.find(params[:incoming_id])
    @note = Note.find(params[:id])
    #@note = @incoming.notes.find(params[:id])
    if @note.update_attributes(params[:note])
      # Save the note successfully
      redirect_to incoming_note_url(@incoming, @note)
    else
      render :action => "edit"
    end
  end

  # DELETE /incomings/1/notes/2
  def destroy
    @incoming = Incoming.find(params[:incoming_id])
    @note = Note.find(params[:id])
    #@note = @incoming.notes.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to incoming_notes_path(@incoming) }
      format.xml  { head :ok }
    end
  end
end
