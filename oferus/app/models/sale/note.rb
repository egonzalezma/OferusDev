class Sale::Note < ActiveRecord::Base








Sale_note_hash = { 	:order_number => "OrdeNum",       
			        :order_type => "ped_npv",           
			        :domain => "ped_domain",           
			        :order_custom_client => "ped_cust", 
			        :order_bill_client => "ped_bill",   
			        :order_ship_client => "ped_ship",    
			        :order_create_date => "ped_crea_date",
			        :order_create_time => "ped_crea_hour",
			        :order_create_user => "ped_crea_user",    
			        :order_generate_date => "ped_genera_date",
			        :order_generate_time => "ped_genera_hour",
			        :order_generate_user => "ped_genera_user",  
			        :order_approves_date => "ped_aprueba_date",
			        :order_approves_time => "ped_aprueba_hour",
			        :order_approves_user => "ped_aprueba_user",  
			        :order_exports_date => "ped_exporta_date",
			        :order_exports_time => "ped_exporta_hour",
			        :order_exports_user => "ped_exporta_user", 
			        :order_origin => "ped_origen",       
			        :order_remove => "ped_retira",         
			        :order_code => "ped_po",          
			        :order_site => "ped_site",        
			        :order_seller_code => "ped_slspsn",   
			        :order_transport_code => "ped_transporte",
			        :order_credit_type => "ped_cr_terms",   
			        :order_discount_type => "ped_cr_card",
			        :order_state => "ped_status"}

Item_hash = {
				:order_number => "OrdeNum",              
	   			:order_item_line => "det_line",         
	   			:domain  =>  "det_domain",                 
	   			:product_identifier => "det_part",         
	   			:product_unit_of_measurement => "det_um",
	   			:order_item_lot =>  "det_qty_ord",        
	   			:order_item_list_price =>  "det_list_pr",    
	   			:order_item_price  =>  "det_price",      
	   			:order_item_discount => "det_discount"
            }

    
    def self.save_from_erp_sale_note (jsonSaleNote)
    data_hash = JSON.parse(jsonSaleNote)
    data_hash_sale_note = data_hash["dsOrder"]
    data_hash_sale_note = data_hash_sale_note["ttvta"]

    @sale_note = nil

    data_hash_sale_note.each do |sn|
    	    sale_note = Sale::Note.new
    	    sale_note.order_number = sn[Sale_note_hash[:order_number]]        
	        sale_note.order_type = sn[Sale_note_hash[:order_type]]          
	        sale_note.domain = sale_note[Sale_note_hash[:domain]]           
	        sale_note.order_custom_client = sn[Sale_note_hash[:order_custom_client]] 
	        sale_note.order_bill_client = sn[Sale_note_hash[:order_bill_client]]   
	        sale_note.order_ship_client = sn[Sale_note_hash[:order_ship_client]]    
	        sale_note.order_create_date = sn[Sale_note_hash[:order_create_date]]
	        sale_note.order_create_time = sn[Sale_note_hash[:order_create_time]]
	        sale_note.order_create_user = sn[Sale_note_hash[:order_create_user]]    
	        sale_note.order_generate_date = sn[Sale_note_hash[:order_generate_date]]
	        sale_note.order_generate_time = sn[Sale_note_hash[:order_generate_time]]
	        sale_note.order_generate_user = sn[Sale_note_hash[:order_generate_user]]  
	        sale_note.order_approves_date = sn[Sale_note_hash[:order_approves_date]]
	        sale_note.order_approves_time = sn[Sale_note_hash[:order_approves_time]]
	        sale_note.order_approves_user = sn[Sale_note_hash[:order_approves_user]]  
	        sale_note.order_exports_date = sn[Sale_note_hash[:order_exports_date]]
	        sale_note.order_exports_time = sn[Sale_note_hash[:order_exports_time]]
	        sale_note.order_exports_user = sn[Sale_note_hash[:order_exports_user]] 
	        sale_note.order_origin = sn[Sale_note_hash[:order_origin]]       
	        sale_note.order_remove = sn[Sale_note_hash[:order_remove]]         
	        sale_note.order_code = sn[Sale_note_hash[:order_code]]          
	        sale_note.order_site = sn[Sale_note_hash[:order_site]]         
	        sale_note.order_seller_code = sn[Sale_note_hash[:order_seller_code]]   
	        sale_note.order_transport_code = sn[Sale_note_hash[:order_transport_code]]
	        sale_note.order_credit_type = sn[Sale_note_hash[:order_credit_type]]   
	        sale_note.order_discount_type = sn[Sale_note_hash[:order_discount_type]]
	        sale_note.order_state = sn[Sale_note_hash[:order_state]]
	        sale_note.save
                
            
            data_hash_sale_note_items = sn["ttdet"]
	        data_hash_sale_note_items.each do |item|
	            	sale_note_item = Sale::Note::Item.new
			        sale_note_item.order_number =  item[Item_hash[:order_number]]              
		   			sale_note_item.order_item_line = item[Item_hash[:order_item_line]]            
		   			sale_note_item.domain  = item[Item_hash[:domain]]                   
		   			sale_note_item.product_identifier = item[Item_hash[:product_identifier]]          
		   			sale_note_item.product_unit_of_measurement = item[Item_hash[:product_unit_of_measurement]] 
		   			sale_note_item.order_item_lot = item[Item_hash[:order_item_lot]]           
		   			sale_note_item.order_item_list_price = item[Item_hash[:order_item_list_price]]       
		   			sale_note_item.order_item_price  = item[Item_hash[:order_item_price]]         
		   			sale_note_item.order_item_discount = item[Item_hash[:order_item_discount]]
		   			sale_note_item.save 
	        end

            @sale_note = sale_note
	              
    end

    return @sale_note
  
  	end

  	def self.get_sale_note_from_json  (jsonSaleNote)
    begin
	    data_hash = JSON.parse(jsonSaleNote)
	    data_hash_sale_note = data_hash["dsOrder"]
	    data_hash_sale_note = data_hash_sale_note["ttvta"]
    	data_hash_sale_note.each do |sn|
    	    sale_note = Sale::Note.new
    	    sale_note.order_number = sn[Sale_note_hash[:order_number]]        
	        sale_note.order_type = sn[Sale_note_hash[:order_type]]          
	        sale_note.domain = sale_note[Sale_note_hash[:domain]]           
	        sale_note.order_custom_client = sn[Sale_note_hash[:order_custom_client]] 
	        sale_note.order_bill_client = sn[Sale_note_hash[:order_bill_client]]   
	        sale_note.order_ship_client = sn[Sale_note_hash[:order_ship_client]]    
	        sale_note.order_create_date = sn[Sale_note_hash[:order_create_date]]
	        sale_note.order_create_time = sn[Sale_note_hash[:order_create_time]]
	        sale_note.order_create_user = sn[Sale_note_hash[:order_create_user]]    
	        sale_note.order_generate_date = sn[Sale_note_hash[:order_generate_date]]
	        sale_note.order_generate_time = sn[Sale_note_hash[:order_generate_time]]
	        sale_note.order_generate_user = sn[Sale_note_hash[:order_generate_user]]  
	        sale_note.order_approves_date = sn[Sale_note_hash[:order_approves_date]]
	        sale_note.order_approves_time = sn[Sale_note_hash[:order_approves_time]]
	        sale_note.order_approves_user = sn[Sale_note_hash[:order_approves_user]]  
	        sale_note.order_exports_date = sn[Sale_note_hash[:order_exports_date]]
	        sale_note.order_exports_time = sn[Sale_note_hash[:order_exports_time]]
	        sale_note.order_exports_user = sn[Sale_note_hash[:order_exports_user]] 
	        sale_note.order_origin = sn[Sale_note_hash[:order_origin]]       
	        sale_note.order_remove = sn[Sale_note_hash[:order_remove]]         
	        sale_note.order_code = sn[Sale_note_hash[:order_code]]          
	        sale_note.order_site = sn[Sale_note_hash[:order_site]]         
	        sale_note.order_seller_code = sn[Sale_note_hash[:order_seller_code]]   
	        sale_note.order_transport_code = sn[Sale_note_hash[:order_transport_code]]
	        sale_note.order_credit_type = sn[Sale_note_hash[:order_credit_type]]   
	        sale_note.order_discount_type = sn[Sale_note_hash[:order_discount_type]]
	        sale_note.order_state = sn[Sale_note_hash[:order_state]]
	        return sale_note
        end
    rescue Exception => e
       nil
    end            
  	end    


	def self.find_by_erp(value)
	    begin
	      @sale_note = RestClient.get(Datum::API_BASE_URL_SALE_NOTE+"?filter=xtpw_nbr=\""+value+"\"").force_encoding("utf-8")
	      return @sale_note
	    rescue Exception => e
	      nil
	    end
	 end



end
