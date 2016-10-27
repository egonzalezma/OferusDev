class Data::ProductController < ApplicationController
  def load
  	@product_erp_successful = false;
    @product_successful = false;
 
    ## Codigo de carga producto
    begin
      @data_product = Product.get_all_products()
      data_products = Product.save_from_erp_product(@data_product)
      @product_erp_successful = true
    rescue => ex
      logger.error ex.message
      @data_products = Product.save_from_erp_product(nil)
      @product_successful = true
    end
    
    ## Mensaje de salida
    @message = ""
    if @product_successful
      @message = @message + "Productos cargados exitosamente desde archivo\n"
    elsif @product_erp_successful
      @message = @message + "Productos cargados exitosamente desde ERP\n"
    end

    return @message 
  end
end
