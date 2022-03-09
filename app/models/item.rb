class Item < ApplicationRecord
   scope :order_category, -> { order(:category) }
   scope :order_quantity, -> { order(:quantity) }
   scope :order_price, -> { order(:price) }
end
