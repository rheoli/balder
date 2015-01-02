class AddExifToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :exif, :text
  end

  def self.down
    remove_column :photos, :exif
  end
end