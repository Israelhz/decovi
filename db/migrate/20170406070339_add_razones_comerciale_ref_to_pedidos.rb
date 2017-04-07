class AddRazonesComercialeRefToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_reference :pedidos, :razones_comerciale, foreign_key: true
  end
end
