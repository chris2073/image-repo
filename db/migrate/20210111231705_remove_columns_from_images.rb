class RemoveColumnsFromImages < ActiveRecord::Migration[6.0]
  def change
    remove_column :images, :name
    remove_column :images, :price
    remove_column :images, :quantity
    remove_column :images, :discounted_price
    add_column :images, :public, :boolean
  end
end
