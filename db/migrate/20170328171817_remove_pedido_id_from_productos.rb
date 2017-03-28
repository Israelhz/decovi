class RemovePedidoIdFromProductos < ActiveRecord::Migration[5.0]
  def change
    remove_column :productos, :pedido_id, :integer
  end
end
