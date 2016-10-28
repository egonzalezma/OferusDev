class Data::ClientController < ApplicationController
  def load
  	@client_erp_successful = false;
    @client_successful = false;

    ## Codigo de carga cliente
    begin
      @data_client = Client.get_all_clients()
      if @data_client != nil
         @data_clients = Client.save_from_erp_client(@data_client)
         @client_erp_successful = true
      else 
         @data_clients = Client.save_from_erp_client(nil)
         @client_successful = true
      end
    rescue => ex
      logger.error ex.message
      @data_clients = Client.save_from_erp_client(nil)
      @client_successful = true
    end
    
    ## Mensaje de salida
    @message = ""
    if @client_successful 
      @message = @message + "Clientes cargados exitosamente desde archivo\n"
    elsif @client_erp_successful
      @message = @message + "Clientes cargados exitosamente desde ERP\n"
    end

    return @message 
  end
end
