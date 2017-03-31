class CreateProductOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :product_orders do |t|
      t.integer :cantidad
      t.integer :producto_id
      t.integer :pedido_id

      t.timestamps
    end
  end
end
