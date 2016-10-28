class Sale::Note < ActiveRecord::Base















	def self.find_by_erp(value)
	    begin
	      @sale_note = RestClient.get(Datum::API_BASE_URL_SALE_NOTE+"?filter=xtpw_nbr=\""+value+"\"").force_encoding("utf-8")
	      return @sale_note
	    rescue Exception => e
	      nil
	    end
	 end



end
