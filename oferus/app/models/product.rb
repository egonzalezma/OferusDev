class Product < ActiveRecord::Base


































####################  BEGIN ERP CLIENT CONFIG ############################

PATH_JSON_FILE_PRODUCT = Datum::PATH_JSON_FILE_PRODUCT

# Begin Index Products data ERP
Products_hash = { :product_identifier => "pt_part",
                  :product_name1 => "pt_desc1",
                  :product_name2 => "pt_desc2",
                  :product_unit_of_measurement => "pt_um",
                  :product_stock_keeping_unit => "pt_article",
                  :product_line => "pt_prod_line",
                  :product_group => "pt_user1",
                  :product_type => "pt_part_type",
                  :product_cellar_location => "pt_loc",
                  :product_normal_price => "pt_price",
                  :product_minimum_price => "pt_minpr",
                  :product_branch_office => "pt_site",
                  :product_stock => "pt__qad01",
                  :domain => "pt_domain"}
                  # oid_pt_mstr":0.0 ¿?
# End Index Products data ERP

  # Funcion para importar de ERP dato product a DataBase
  def self.save_from_erp_product (jsonProductList = nil)
    if jsonProductList == nil
       jsonProductList = File.read("#{PATH_JSON_FILE_PRODUCT}")
    end
    data_hash = JSON.parse(jsonProductList)
    data_hash_products = data_hash["dspt_mstr"]
    data_hash_products = data_hash_products["ttpt_mstr"]

    data_hash_products.each do |product|
      @product = Product.new
      @product.product_identifier = product[Products_hash[:product_identifier]]
      @product.product_name1 = product[Products_hash[:product_name1]]
      @product.product_name2 = product[Products_hash[:product_name2]]
      @product.product_unit_of_measurement = product[Products_hash[:product_unit_of_measurement]]
      @product.product_stock_keeping_unit = product[Products_hash[:product_stock_keeping_unit]]
      @product.product_line = product[Products_hash[:product_line]]
      @product.product_group = product[Products_hash[:product_group]]
      @product.product_type = product[Products_hash[:product_type]]
      @product.product_cellar_location = product[Products_hash[:product_cellar_location]]
      @product.product_normal_price = product[Products_hash[:product_normal_price]]
      @product.product_minimum_price = product[Products_hash[:product_minimum_price]]
      @product.product_branch_office = product[Products_hash[:product_branch_office]]
      @product.product_stock = product[Products_hash[:product_stock]]
      @product.domain = product[Products_hash[:domain]]
      @product.save
    end

    return "Carga realizada con exito"
  
  end

  def self.find_by(attribute, value)
    att = Products_hash[attribute]
    @data_product = RestClient.get(Datum::API_BASE_URL_PRODUCT_ALL+" and "+att+"=\""+value+"\"").force_encoding("utf-8")
    return @data_product
  end

  def self.get_all_products()
    @data_product = RestClient.get(Datum::API_BASE_URL_PRODUCT_ALL).force_encoding("utf-8")
    return @data_product
  end

####################  END ERP CLIENT CONFIG ############################

end
