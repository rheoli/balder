class AddFlickrToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :flickr, :string
  end

  def self.down
    remove_column :photos, :flickr
  end
end