class AddIdClientToClientToClient < ActiveRecord::Migration
  def change
    add_column :clients, :id_client_to_client, :string
  end
end
