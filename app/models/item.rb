class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :genre_shipping_cost
  belongs_to_active_hash :genre_shipping_day
  belongs_to_active_hash :genre_status
  belongs_to_active_hash :genre
  belongs_to_active_hash :genre_prefecture
  belongs_to :user #optional: true

  
  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :selling_price, numericality: { only_integer: true ,greater_than_or_equal_to: 300, less_than_or_equal_to: 999999999} 
    validates :genre_shipping_cost_id, numericality: { other_than: 1 }
    validates :genre_shipping_day_id, numericality: { other_than: 1 }
    validates :genre_status_id, numericality: { other_than: 1 }
    validates :genre_id, numericality: { other_than: 1 }
    validates :genre_prefecture_id, numericality: { other_than: 1 }

  end
  validates :selling_price, format: {with: /\A[0-9]+\z/}
end

