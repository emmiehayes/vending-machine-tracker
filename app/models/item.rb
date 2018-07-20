class Item < ApplicationRecord
  has_many :machine_items
  has_many :machines, through: :machines_items
end
