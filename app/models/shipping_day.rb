class ShippingDay < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_shipping_day

  validates :genre_shipping_day_id, presence: true, numericality: { other_than: 1 }
end
