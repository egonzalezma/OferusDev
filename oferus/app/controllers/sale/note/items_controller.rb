class Sale::Note::ItemsController < ApplicationController
  before_action :set_sale_note_item, only: [:show, :edit, :update, :destroy]

  # GET /sale/note/items
  # GET /sale/note/items.json
  def index
    @sale_note_items = Sale::Note::Item.all
  end

  # GET /sale/note/items/1
  # GET /sale/note/items/1.json
  def show
  end

  # GET /sale/note/items/new
  def new
    @sale_note_item = Sale::Note::Item.new
  end

  # GET /sale/note/items/1/edit
  def edit
  end

  # POST /sale/note/items
  # POST /sale/note/items.json
  def create
    @sale_note_item = Sale::Note::Item.new(sale_note_item_params)

    respond_to do |format|
      if @sale_note_item.save
        format.html { redirect_to @sale_note_item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @sale_note_item }
      else
        format.html { render :new }
        format.json { render json: @sale_note_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale/note/items/1
  # PATCH/PUT /sale/note/items/1.json
  def update
    respond_to do |format|
      if @sale_note_item.update(sale_note_item_params)
        format.html { redirect_to @sale_note_item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_note_item }
      else
        format.html { render :edit }
        format.json { render json: @sale_note_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale/note/items/1
  # DELETE /sale/note/items/1.json
  def destroy
    @sale_note_item.destroy
    respond_to do |format|
      format.html { redirect_to sale_note_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_note_item
      @sale_note_item = Sale::Note::Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_note_item_params
      params.fetch(:sale_note_item, {})
    end
end
