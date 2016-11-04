class Datum < ActiveRecord::Base


# Begin Config PATH client ERP
  # Client URL
  API_BASE_URL_CLIENT_INFO = "http://mobile.isesa.cl:8810/Cliente/static/ClienteService.json"
  API_BASE_URL_CLIENT_ALL = "http://mobile.isesa.cl:8810/Cliente/rest/ClienteService/admstr?filter=ad_domain=\"itaka\""

  # Client local URL
  PATH_JSON_FILE_CLIENT = "json/ClientesItaka.json"

  # Product URL
  API_BASE_URL_PRODUCT_INFO = "http://mobile.isesa.cl:8810/ptmstr/static/ptmstrService.json"
  API_BASE_URL_PRODUCT_ALL = "http://mobile.isesa.cl:8810/ptmstr/rest/ptmstrService/ptmstr?filter=pt_domain=\"itaka\""


  # Product local URL
  PATH_JSON_FILE_PRODUCT ="json/ProductosItaka.json"
 

  # Sales note URL
  API_BASE_URL_SALE_NOTE_INFO = "http://mobile.isesa.cl:8810/NotaVenta/static/NotaVentaService.json"
  API_BASE_URL_SALE_NOTE = "http://mobile.isesa.cl:8810/NotaVenta/rest/NotaVentaService/NotVen"
  
# End Config PATH client ERP


  # Funcion para importar de ERP dato product a DataBase
  def self.checkERP ()
    @Status = {:read_product => false, :read_client => false, :write_sale_note => false}
    @product_test = Product.find_by_erp(:product_identifier,"101001")
    @client_test = Client.find_by_erp(:client_unique_number,"00000300")
    @sale_note_test = Sale::Note.find_by_erp("GOT7812")
   if @sale_note_test != nil 
    @Status[:write_sale_note] = true
   end

   if @product_test != nil
    @Status [:read_product] = true
   end 

   if @client_test != nil
    @Status [:read_client] = true
   end
   
   return @Status
  end

end
