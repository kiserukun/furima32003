class ShippingCost < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_shipping_cost

  validates :genre_shipping_cost_id, presence: true, numericality: { other_than: 1 }
end
