class Sale::NotesController < ApplicationController
  before_action :set_sale_note, only: [:show, :edit, :update, :destroy]

  # GET /sale/notes
  # GET /sale/notes.json
  def index
    @sale_notes = Sale::Note.all
  end

  # GET /sale/notes/1
  # GET /sale/notes/1.json
  def show
  end

  # GET /sale/notes/new
  def new
    @sale_note = Sale::Note.new
  end

  # GET /sale/notes/1/edit
  def edit
  end

  # POST /sale/notes
  # POST /sale/notes.json
  def create
    @sale_note = Sale::Note.new(sale_note_params)

    respond_to do |format|
      if @sale_note.save
        format.html { redirect_to @sale_note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @sale_note }
      else
        format.html { render :new }
        format.json { render json: @sale_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale/notes/1
  # PATCH/PUT /sale/notes/1.json
  def update
    respond_to do |format|
      if @sale_note.update(sale_note_params)
        format.html { redirect_to @sale_note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_note }
      else
        format.html { render :edit }
        format.json { render json: @sale_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale/notes/1
  # DELETE /sale/notes/1.json
  def destroy
    @sale_note.destroy
    respond_to do |format|
      format.html { redirect_to sale_notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_note
      @sale_note = Sale::Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_note_params
      params.fetch(:sale_note, {})
    end
end
