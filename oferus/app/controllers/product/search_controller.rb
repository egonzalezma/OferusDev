class Product::SearchController < ApplicationController
  def index
     begin
    	if params[:searchbox].strip.length > 1
    		@products = Product.find_by_erp(:product_identifier, params[:searchbox].strip)
    		if @products != nil
    			@product = Product.get_product_from_json(@products)
    			if @product != nil
    				return @product
    			else
    				return @product = 'a'
    		    end
	    	else
	       		return @product = 'e'
	       	end
	    else
	    	return @product = 'i'
	    end
    rescue Exception => e
    	return @product = '-'
    end
  end
end
