class AddEmpleadoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :empleado, :boolean, :default => false, :null => false
  end
end
