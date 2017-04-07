class AddDireccionesEntregaRefToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_reference :pedidos, :direcciones_entrega, foreign_key: true
  end
end
