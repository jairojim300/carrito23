# coding: utf-8

# Migracion extra para poder adicionar, el campo foto como require paperclip
# ver "app/models/producto.rb"
class AddProductosFoto < ActiveRecord::Migration
  def self.up
    add_column :productos, :foto_file_name, :string
    add_column :productos, :foto_file_size, :integer
  end

  def self.down
    remove_column :productos, :foto_file_name
    remove_column :productos, :foto_file_size
  end
end
