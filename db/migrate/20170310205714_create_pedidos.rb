class CreatePedidos < ActiveRecord::Migration[5.0]
  def change
    create_table :pedidos do |t|
      t.text :tipo
      t.text :estatus

      t.timestamps
    end
  end
end
