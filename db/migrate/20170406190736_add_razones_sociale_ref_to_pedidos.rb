class AddRazonesSocialeRefToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_reference :pedidos, :razones_sociale, foreign_key: true
  end
end
