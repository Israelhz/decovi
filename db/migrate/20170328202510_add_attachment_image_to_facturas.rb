class AddAttachmentImageToFacturas < ActiveRecord::Migration
  def self.up
    change_table :facturas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :facturas, :image
  end
end
