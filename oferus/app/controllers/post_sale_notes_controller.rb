class PostSaleNotesController < ApplicationController

	def index
    @sale_notes = Sale::Note.all
    count = (@sale_notes.length).to_s
    time = Time.now
    Time::DATE_FORMATS[:time_oferus] = '%H:%M:%S'
    Time::DATE_FORMATS[:date_oferus] = '%Y-%m-%d'
    id = time.to_formatted_s(:number)  
    hour = time.to_formatted_s(:time_oferus)
    date = time.to_formatted_s(:date_oferus)  
			bodya = {
				"dsOrder": {
					"ttvta": [{"OrdeNum": "PRUEBAOFERUSa"+count+id ,
						"ped_npv": "ST", 
						"ped_domain": "ITAKA",
						"ped_cust": "86053400",
						"ped_bill": "86053400",
						"ped_ship": "86053400",
						"ped_ord_date": date,
						"ped_crea_date": date,
						"ped_crea_hour": hour,
						"ped_genera_user": "KCATALAN",
						"ped_crea_user": "KCATALAN",
						"ped_aprueba_user": "KCATALAN",
						"ped_exporta_date": date,
						"ped_exporta_hour": hour,
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
						"ped_genera_date": date,
						"ped_genera_hour": hour,
						"ped_aprueba_date": date,
						"ped_aprueba_hour": hour,
						"ttdet": [{
							"OrdeNum": "PRUEBAOFERUSa"+count+id ,
							"det_line": 1,
							"det_domain": "ITAKA",
							"det_part": "123761",
							"det_um": "PZ",
							"det_qty_ord": 1,
							"det_list_pr": 16308,
							"det_discount": 50,
							"det_price": 799092
						}]
					}]
				}
			}

			bodyb = {
				"dsOrder": {
					"ttvta": [{"OrdeNum": "PRUEBAOFERUSb"+count+id ,
						"ped_npv": "ST", 
						"ped_domain": "ITAKA",
						"ped_cust": "UCVICUÑA",
						"ped_bill": "UCVICUÑA ",
						"ped_ship": "UCVICUÑA ",
						"ped_ord_date": date,
						"ped_crea_date": date,
						"ped_crea_hour": hour,
						"ped_genera_user": "KCATALAN",
						"ped_crea_user": "KCATALAN",
						"ped_aprueba_user": "KCATALAN",
						"ped_exporta_date": date,
						"ped_exporta_hour": hour,
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
						"ped_genera_date": date,
						"ped_genera_hour": hour,
						"ped_aprueba_date": date,
						"ped_aprueba_hour": hour,
						"ttdet": [{
							"OrdeNum": "PRUEBAOFERUSb"+count+id ,
							"det_line": 1,
							"det_domain": "ITAKA",
							"det_part": "123761",
							"det_um": "PZ",
							"det_qty_ord": 1,
							"det_list_pr": 16308,
							"det_discount": 50,
							"det_price": 799092
						},
						{
							"OrdeNum": "PRUEBAOFERUSb"+count+id,
							"det_line": 0,
							"det_domain": "ITAKA",
							"det_part": "999313",
							"det_um": "PZ",
							"det_qty_ord": 1,
							"det_list_pr": 6988,
							"det_discount": 0,
							"det_price": 6988 
						}]
					}]
				}
			}

			

			bodyd = {
				"dsOrder": {
					"ttvta": [{"OrdeNum": "PRUEBAOFERUSd"+count+id ,
						"ped_npv": "ST", 
						"ped_domain": "ITAKA",
						"ped_cust": "05090671",
						"ped_bill": "05090671",
						"ped_ship": "05090671",
						"ped_ord_date": date,
						"ped_crea_date": date,
						"ped_crea_hour": hour,
						"ped_genera_user": "KCATALAN",
						"ped_crea_user": "KCATALAN",
						"ped_aprueba_user": "KCATALAN",
						"ped_exporta_date": date,
						"ped_exporta_hour": hour,
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
						"ped_genera_date": date,
						"ped_genera_hour": hour,
						"ped_aprueba_date": date,
						"ped_aprueba_hour": hour,
						"ttdet": [{
							"OrdeNum": "PRUEBAOFERUSd"+count+id ,
							"det_line": 0,
							"det_domain": "ITAKA",
							"det_part": "103050",
							"det_um": "PZ",
							"det_qty_ord": 5,
							"det_list_pr": 6134,
							"det_discount": 10,
							"det_price": 4294
						}]
					}]
				}
			}

			bodye = {
				"dsOrder": {
					"ttvta": [{"OrdeNum": "PRUEBAOFERUSe"+count+id ,
						"ped_npv": "ST", 
						"ped_domain": "ITAKA",
						"ped_cust": "76851SUC",
						"ped_bill": "76851SUC",
						"ped_ship": "76851SUC",
						"ped_ord_date": date,
						"ped_crea_date": date,
						"ped_crea_hour": hour,
						"ped_genera_user": "KCATALAN",
						"ped_crea_user": "KCATALAN",
						"ped_aprueba_user": "KCATALAN",
						"ped_exporta_date": date,
						"ped_exporta_hour": hour,
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
						"ped_genera_date": date,
						"ped_genera_hour": hour,
						"ped_aprueba_date": date,
						"ped_aprueba_hour": hour,
						"ttdet": [{
							"OrdeNum": "PRUEBAOFERUSe"+count+id ,
							"det_line": 0,
							"det_domain": "ITAKA",
							"det_part": "103064",
							"det_um": "PZ",
							"det_qty_ord": 2,
							"det_list_pr": 25252,
							"det_discount": 50,
							"det_price": 17676
						}]
					}]
				}
			}

		begin
			sale_note = nil
            modulo = @sale_notes.length%4
            if modulo == 0
            	@response = RestClient.post(Datum::API_BASE_URL_SALE_NOTE , bodya.to_json, {content_type: :json, accept: :json})
                sale_note = Sale::Note.save_from_erp_sale_note (bodya.to_json) 
            end

            if modulo == 1
            	@response = RestClient.post(Datum::API_BASE_URL_SALE_NOTE , bodyb.to_json, {content_type: :json, accept: :json})
            	sale_note = Sale::Note.save_from_erp_sale_note (bodyb.to_json)
            end

            if modulo == 2
            	@response = RestClient.post(Datum::API_BASE_URL_SALE_NOTE , bodyd.to_json, {content_type: :json, accept: :json})
            	sale_note = Sale::Note.save_from_erp_sale_note (bodyd.to_json)
            end

            if modulo == 3
            	@response = RestClient.post(Datum::API_BASE_URL_SALE_NOTE , bodye.to_json, {content_type: :json, accept: :json})
            	sale_note = Sale::Note.save_from_erp_sale_note (bodye.to_json)
            end

			
   			@sale_note = sale_note



		@arr =	 { :m => "Nota de venta ingresada exitosamente a ERP Caso: "+modulo.to_s, :sn => @sale_note} 
		
		rescue => e
		 @arr =	 { :m => "Problemas con el servicio Web ERP Caso: "+modulo.to_s, :sn => @sale_note} 
		end
	end

end