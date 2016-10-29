class Product::SearchController < ApplicationController
  def index
  	@products = Product.find_by_erp(:product_stock_keeping_unit, params[:searchbox])

    respond_to do |format|

      format.html # index.html.erb

    end
    @products
  end
end
