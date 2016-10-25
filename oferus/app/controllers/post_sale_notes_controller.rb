class PostSaleNotesController < ApplicationController
	#def index
	#	@json = {"hola": "hola", "chao": "chao"}.to_json
	#	@res = JSON.parse(@json)
	#end

	def index
		json_nv_2 = {
				"dsOrder": {
					"ttvta": [{
						"OrdeNum": "PRUEBAOFERUS",
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
			@response = RestClient.post("http://mobile.isesa.cl:8810/NotaVenta/rest/NotaVentaService/NotVen", json_nv_2.to_json, {content_type: :json, accept: :json})
		rescue => e
			@response = e.response
		end
	end

end