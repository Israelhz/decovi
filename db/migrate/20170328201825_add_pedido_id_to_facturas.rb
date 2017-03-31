class AddPedidoIdToFacturas < ActiveRecord::Migration[5.0]
  def change
    add_column :facturas, :pedido_id, :integer
  end
end
