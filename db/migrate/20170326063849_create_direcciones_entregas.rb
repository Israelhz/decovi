class CreateDireccionesEntregas < ActiveRecord::Migration[5.0]
  def change
    create_table :direcciones_entregas do |t|
      t.string :estado
      t.string :municipio
      t.string :colonia
      t.integer :numero
      t.integer :cp
      t.string :telefono
      t.text :notas
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
