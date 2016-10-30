class Product::SearchController < ApplicationController
  def index
  	@products = Product.find_by_erp(:product_stock_keeping_unit, params[:searchbox])
    if @products != nil
       @product = Product.get_product_from_json(@products)
    else
       return nil
    end
    @product
  end
end
