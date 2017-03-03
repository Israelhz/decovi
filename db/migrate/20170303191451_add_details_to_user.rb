class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nombre, :text
    add_column :users, :apellidoPaterno, :text
    add_column :users, :apellidoMaterno, :text
    add_column :users, :aprobado, :boolean, :default => false, :null => false
    add_column :users, :paginaWeb, :text
    add_column :users, :notas, :text
    add_column :users, :puesto, :text
    add_column :users, :admin, :boolean, :default => false, :null => false
    add_column :users, :ventas, :boolean, :default => false, :null => false
    add_column :users, :individuo, :boolean, :default => false, :null => false
    add_column :users, :empresa, :boolean, :default => false, :null => false
  end
end
