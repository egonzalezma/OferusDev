class Sale::Note < ActiveRecord::Base



	def self.create_note(products)
		params  =  { :name => "dsOrder",
	                 :type => { :dsOrder => 
			                              {:ttvta => [{ :OrdeNum => "CHARACTER",
													    :ped_npv => "CHARACTER",
													    :ped_domain => "",
													    :ped_cust => "CHARACTER",
													    :ped_bill => "CHARACTER", 
													    :ped_ship => "CHARACTER", 
													    :ped_ord_date => "DATE", 
													    :ped_crea_date => "DATE",
													 	:ped_crea_hour => "CHARACTER",
													    :ped_genera_user => "CHARACTER",
													    :ped_crea_user => "CHARACTER",
													    :ped_aprueba_user => "CHARACTER",
													    :ped_exporta_date => "DATE", 
													    :ped_exporta_hour => "CHARACTER",
													    :ped_exporta_user => "CHARACTER",
													    :ped_origen => "CHARACTER", 
													    :ped_retira => "CHARACTER", 
													    :ped_po => "CHARACTER", 
													    :ped_site => "CHARACTER", 
													    :ped_slspsn => "CHARACTER", 
													    :ped_transporte => "CHARACTER",
													    :ped_cr_terms => "CHARACTER", 
													    :ped_cr_card => "CHARACTER", 
													    :ped_status => "INTEGER",
													    :ped_genera_date => "DATE", 
													    :ped_genera_hour => "CHARACTER", 
													    :ped_aprueba_date => "DATE", 
													    :ped_aprueba_hour => "CHARACTER",
													    :ttdet => [{ :OrdeNum => "CHARACTER",
																	 :det_line => "INTEGER",
																	 :det_domain => "CHARACTER",
																	 :det_part => "CHARACTER",
																	 :det_part => "CHARACTER", 
																	 :det_qty_ord => "INTEGER",
																	 :det_list_pr => "INTEGER",
																	 :det_discount => "INTEGER",
																	 :det_price => "INTEGER"
																  }] 
													 }]
			                              }
	                          }
	                }
	    
		params  =   params.to_json   
		Rails.logger.info "params: #{params}"
		response = RestClient.post(Datum::API_BASE_URL_SALE_NOTE, params , {content_type: :json, accept: :json})
		return params
	end


end
