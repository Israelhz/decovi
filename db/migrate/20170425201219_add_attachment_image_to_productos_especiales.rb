class AddAttachmentImageToProductosEspeciales < ActiveRecord::Migration
  def self.up
    change_table :productos_especiales do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :productos_especiales, :image
  end
end
