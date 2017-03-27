class CreateRazonesComerciales < ActiveRecord::Migration[5.0]
  def change
    create_table :razones_comerciales do |t|
      t.string :nombre
      t.string :area
      t.string :telefono1
      t.string :telefono2
      t.references :razones_sociale, foreign_key: true

      t.timestamps
    end
  end
end
