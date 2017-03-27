class CreateRazonesSociales < ActiveRecord::Migration[5.0]
  def change
    create_table :razones_sociales do |t|
      t.string :nombre
      t.string :rfc
      t.string :email
      t.string :direccion
      t.string :telefono
      t.text :notas
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
