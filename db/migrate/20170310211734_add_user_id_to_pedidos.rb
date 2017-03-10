class AddUserIdToPedidos < ActiveRecord::Migration[5.0]
  def change
    add_column :pedidos, :user_id, :integer
    add_index :pedidos, :user_id
  end
end
