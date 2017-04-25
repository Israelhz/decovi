class CreateProductosEspeciales < ActiveRecord::Migration[5.0]
  def change
    create_table :productos_especiales do |t|
      t.text :nombre
      t.text :acabado
      t.boolean :aprobado
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
