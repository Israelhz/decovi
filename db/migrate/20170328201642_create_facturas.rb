class CreateFacturas < ActiveRecord::Migration[5.0]
  def change
    create_table :facturas do |t|
      t.text :folio
      t.integer :user_id

      t.timestamps
    end
  end
end
