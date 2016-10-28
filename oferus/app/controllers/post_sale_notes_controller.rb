class PostSaleNotesController < ApplicationController
	#def index
	#	@json = {"hola": "hola", "chao": "chao"}.to_json
	#	@res = JSON.parse(@json)
	#end

	def index
    time = DateTime.new.to_s
		body = {
				"dsOrder": {
					"ttvta": [{
						"OrdeNum": "PRUEBAOFERUS"+time,
						"ped_npv": "ST",
						"ped_domain": "ITAKA",
						"ped_cust": "86053400",
						"ped_bill": "86053400",
						"ped_ship": "86053400",
						"ped_ord_date": "2016-10-20",
						"ped_crea_date": "2016-10-20",
						"ped_crea_hour": "9:00:22",
						"ped_genera_user": "KCATALAN",
						"ped_crea_user": "KCATALAN",
						"ped_aprueba_user": "KCATALAN",
						"ped_exporta_date": "2016-10-20",
						"ped_exporta_hour": "10:00:41",
						"ped_exporta_user": "EALBORNO",
						"ped_origen": "Directo",
						"ped_retira": "Cliente",
						"ped_po": "44552",
						"ped_site": "2000",
						"ped_slspsn": "300",
						"ped_transporte": "0",
						"ped_cr_terms": "CONTADO",
						"ped_cr_card": "XF",
						"ped_status": 9,
						"ped_genera_date": "2016-10-20",
						"ped_genera_hour": "9:00:22",
						"ped_aprueba_date": "2016-10-20",
						"ped_aprueba_hour": "9:00:22",
						"ttdet": [{
							"OrdeNum": "PRUEBAOFERUS",
							"det_line": 1,
							"det_domain": "ITAKA",
							"det_part": "123761",
							"det_um": "PZ",
							"det_qty_ord": 1,
							"det_list_pr": 16308,
							"det_discount": 50,
							"det_price": -799092
						}]
					}]
				}
			}

		begin
			@response = RestClient.post(Datum::API_BASE_URL_SALE_NOTE , body.to_json, {content_type: :json, accept: :json})
			sale_note = new Sale::Note 
			sale_note.order_number = "PRUEBAOFERUS"+time        
	        sale_note.order_type = "ST"           
	        sale_note.domain = "ITAKA"           
	        sale_note.order_custom_client = "86053400" 
	        sale_note.order_bill_client = "86053400"   
	        sale_note.order_ship_client = "86053400"    
	        sale_note.order_create_date = "2016-10-20"
	        sale_note.order_create_time = "9:00:22"
	        sale_note.order_create_user = "KCATALAN"    
	        sale_note.order_generate_date = "2016-10-20"
	        sale_note.order_generate_time = "9:00:22"
	        sale_note.order_generate_user = "KCATALAN"  
	        sale_note.order_approves_date = "2016-10-20"
	        sale_note.order_approves_time = "9:00:22"
	        sale_note.order_approves_user = "KCATALAN"  
	        sale_note.order_exports_date = "2016-10-20"
	        sale_note.order_exports_time = "10:00:41"
	        sale_note.order_exports_user = "EALBORNO" 
	        sale_note.order_origin = "Directo"       
	        sale_note.order_remove = "Cliente"         
	        sale_note.order_code = "44552"          
	        sale_note.order_site = "2000"         
	        sale_note.order_seller_code = "300"   
	        sale_note.order_transport_code = "0"
	        sale_note.order_credit_type = "CONTADO"   
	        sale_note.order_discount_type = "XF"
	        sale_note.order_state = 9
	        sale_note.save

	        sale_note_item = new Sale::Note::Item 
	        sale_note_item.order_number = "PRUEBAOFERUS"+time               
   			sale_note_item.order_item_line = 1           
   			sale_note_item.domain  = "ITAKA"                  
   			sale_note_item.product_identifier = "123761"         
   			sale_note_item.product_unit_of_measurement = "PZ"
   			sale_note_item.order_item_lot = 1          
   			sale_note_item.order_item_list_price = 16308      
   			sale_note_item.order_item_price  = -799092        
   			sale_note_item.order_item_discount = 50
   			sale_note_item.save        

			@message = "Nota de venta ingresada exitosamente a ERP"
		rescue => e
			@message = "Problemas con el servicio Web ERP"
		end
	end

end