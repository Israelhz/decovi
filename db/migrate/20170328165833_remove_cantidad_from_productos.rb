class RemoveCantidadFromProductos < ActiveRecord::Migration[5.0]
  def change
    remove_column :productos, :cantidad, :integer
  end
end
