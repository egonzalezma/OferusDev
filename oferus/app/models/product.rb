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
    begin
          att = Products_hash[attribute]
          @data_product = RestClient.get(Datum::API_BASE_URL_PRODUCT_ALL+" and "+att+"=\""+value+"\"").force_encoding("utf-8")
          return @data_product
    rescue Exception => e
          nil
    end
  end

  def self.get_all_products()
    begin
          @data_product = RestClient.get(Datum::API_BASE_URL_PRODUCT_ALL).force_encoding("utf-8")
          return @data_product
    rescue Exception => e
          nil
    end
  end
  
  # ARREGLAR
  def self.create_product(product)
    payload  =  {:request => { :name => "dspt_mstr",
                               :type => {:dspt_mstr => 
                                          {:ttpt_mstr => [{
                                             :pt_part => "101001",
                                             :pt_desc1 => "CORTADORA PANELVERTICAL",
                                             :pt_desc2 => "C4- EX  SAW SAFETY",
                                             :pt_um => "PZ",
                                             :pt_article => "7809824004415",
                                             :pt_prod_line => "SAFM",
                                             :pt_user1 => "OTROS",
                                             :pt_part_type => "SAFE002",
                                             :pt_loc => "CDIT1001",
                                             :pt_price => 1849420.0,
                                             :pt_minpr => 1294594.0,
                                             :pt_site => "2000",
                                             :pt_domain => "ITAKA",
                                             :pt__qad01 => 2.0,
                                             :oid_pt_mstr => 0.0}]
                                           }
                                         }
                            }
               }

    payload  =   payload[:request].to_json   
    Rails.logger.info "Payload: #{payload}"

    response = RestClient.post(Datum::API_BASE_URL_PRODUCT, payload , {content_type: :json, accept: :json})
   
    return payload
   end
####################  END ERP CLIENT CONFIG ############################

end
