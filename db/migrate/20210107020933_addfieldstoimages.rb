class Addfieldstoimages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :price, :decimal, :precision => 10, :scale => 2
    add_column :images, :discounted_price, :decimal, :precision => 10, :scale => 2
  end
end
