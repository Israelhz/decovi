class AddDireccionesFacturaRefToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_reference :pedidos, :direcciones_factura, foreign_key: true
  end
end
