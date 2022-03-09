class AddColumnPriceAndQuantityInItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :begin_price, :string
    add_column :items, :price, :string
    add_column :items, :quantity, :integer
  end
end
