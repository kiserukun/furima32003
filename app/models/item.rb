class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  with_options presence: true do
    validates :description
    validates :selling_price
    validates :user
  end
end
