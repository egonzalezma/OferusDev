class Product::BrandsController < ApplicationController
  before_action :set_product_brand, only: [:show, :edit, :update, :destroy]

  # GET /product/brands
  # GET /product/brands.json
  def index
    @product_brands = Product::Brand.all
  end

  # GET /product/brands/1
  # GET /product/brands/1.json
  def show
  end

  # GET /product/brands/new
  def new
    @product_brand = Product::Brand.new
  end

  # GET /product/brands/1/edit
  def edit
  end

  # POST /product/brands
  # POST /product/brands.json
  def create
    @product_brand = Product::Brand.new(product_brand_params)

    respond_to do |format|
      if @product_brand.save
        format.html { redirect_to @product_brand, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @product_brand }
      else
        format.html { render :new }
        format.json { render json: @product_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product/brands/1
  # PATCH/PUT /product/brands/1.json
  def update
    respond_to do |format|
      if @product_brand.update(product_brand_params)
        format.html { redirect_to @product_brand, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_brand }
      else
        format.html { render :edit }
        format.json { render json: @product_brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product/brands/1
  # DELETE /product/brands/1.json
  def destroy
    @product_brand.destroy
    respond_to do |format|
      format.html { redirect_to product_brands_url, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_brand
      @product_brand = Product::Brand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_brand_params
      params.fetch(:product_brand, {})
    end
end
