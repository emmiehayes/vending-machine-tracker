class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_items
  has_many :items, through: :machine_items

  def average_price
    items.average(:price)
  end

  def item_total
    items.count
  end
end
