class AddPedidoIdToProductos < ActiveRecord::Migration[5.0]
  def change
    add_column :productos, :pedido_id, :integer
    add_index :productos, :pedido_id
  end
end
