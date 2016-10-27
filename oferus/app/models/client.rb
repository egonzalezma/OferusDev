class Client < ActiveRecord::Base


####################  BEGIN ERP CLIENT CONFIG ############################

PATH_JSON_FILE_CLIENT = Datum::PATH_JSON_FILE_CLIENT

# Begin Index Clients data ERP
Clients_hash = {  :client_unique_number => "ad_addr",
                  :client_rut => "ad_pst_id",
                  :client_name1 => "ad_name",
                  :client_name2 => "ad_line1",
                  :client_address1 => "ad_line2",
                  :client_address2 => "ad_line3",
                  :client_city => "ad_city",
                  :client_phone => "ad_phone",
                  :client_fax => "ad_fax",
                  :client_cell_phone => "ad_ref",
                  :client_web_site => "ad_attn2",
                  :domain => "ad_domain",
                  :client_type1 => "ad_misc1_id",
                  :client_type2 => "ad_misc2_id"}
# End Index Clients data ERP

  # Public functions
  # Funcion para importar de ERP dato cliente a DataBase
  def self.save_from_erp_client (jsonClientList = nil)
    if jsonClientList == nil
       jsonClientList = File.read("#{PATH_JSON_FILE_CLIENT}")
    end    
    data_hash = JSON.parse(jsonClientList)
    data_hash_clients = data_hash["dsad_mstr"]
    data_hash_clients = data_hash_clients["ttad_mstr"]

    data_hash_clients.each do |client|
      @client = Client.new
      @client.client_unique_number = client[Clients_hash[:client_unique_number]]
      @client.client_rut = client[Clients_hash[:client_rut]]
      @client.client_name1 = client[Clients_hash[:client_name1]]
      @client.client_name2 = client[Clients_hash[:client_name2]]
      @client.client_address1 = client[Clients_hash[:client_address1]]
      @client.client_address2 = client[Clients_hash[:client_address2]]
      @client.client_city = client[Clients_hash[:client_city]]
      @client.client_phone = client[Clients_hash[:client_phone]]
      @client.client_fax = client[Clients_hash[:client_fax]]
      @client.client_cell_phone = client[Clients_hash[:client_cell_phone]]
      @client.client_web_site = client[Clients_hash[:client_web_site]]
      @client.domain = client[Clients_hash[:domain]]
      @client.client_type1 = client[Clients_hash[:client_type1]]
      @client.client_type2 = client[Clients_hash[:client_type2]]
      @client.save
    end
 
    return "Carga realizada con exito"

  end

  def self.find_by(attribute, value)
    att = Clients_hash[attribute]
    @data_client = RestClient.get(Datum::API_BASE_URL_CLIENT_ALL+" and "+att+"=\""+value+"\"").force_encoding("utf-8")
    return @data_client
  end

  def self.get_all_clients()
    @data_client = RestClient.get(Datum::API_BASE_URL_CLIENT_ALL).force_encoding("utf-8")
    return @data_client
  end

####################  END ERP CLIENT CONFIG ############################

end
