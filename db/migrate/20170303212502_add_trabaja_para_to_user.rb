class AddTrabajaParaToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :trabajaPara, :integer, :default => 0
  end
end
