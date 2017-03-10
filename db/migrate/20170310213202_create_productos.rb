class CreateProductos < ActiveRecord::Migration[5.0]
  def change
    create_table :productos do |t|
      t.text :nombre
      t.text :acabado
      t.integer :cantidad

      t.timestamps
    end
  end
end
