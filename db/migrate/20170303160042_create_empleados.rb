class CreateEmpleados < ActiveRecord::Migration[5.0]
  def change
    create_table :empleados do |t|
      t.string :nombre
      t.string :apellidoM
      t.string :apellidoP
      t.string :correo
      t.string :password

      t.timestamps
    end
  end
end
