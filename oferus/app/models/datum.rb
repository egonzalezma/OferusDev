class Datum < ActiveRecord::Base


# Begin Config PATH client ERP
  # Client URL
  API_BASE_URL_CLIENT = "http://mobile.isesa.cl:8810/Cliente/static/ClienteService.json"
  API_BASE_URL_CLIENT_ALL = "http://mobile.isesa.cl:8810/Cliente/rest/ClienteService/admstr?filter=ad_domain=\"itaka\""

  # Client local URL
  PATH_JSON_FILE_CLIENT = "json/ClientesItaka.json"

  # Product URL
  API_BASE_URL_PRODUCT = "http://mobile.isesa.cl:8810/ptmstr/static/ptmstrService.json"
  API_BASE_URL_PRODUCT_ALL = "http://mobile.isesa.cl:8810/ptmstr/rest/ptmstrService/ptmstr?filter=pt_domain=\"itaka\""


  # Product local URL
  PATH_JSON_FILE_PRODUCT ="json/ProductosItaka.json"
 

  # Sales note URL
  API_BASE_URL_SALE_NOTE = "http://mobile.isesa.cl:8810/NotaVenta/static/NotaVentaService.json"
  
  
# End Config PATH client ERP




end
