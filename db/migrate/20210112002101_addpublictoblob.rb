class Addpublictoblob < ActiveRecord::Migration[6.0]
  def change
    add_column :active_storage_attachments, :public, :boolean
  end
end
