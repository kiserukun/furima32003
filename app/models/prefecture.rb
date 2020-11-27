class Prefecture < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_prefecture

  validates :genre_prefecture_id, presence: true, numericality: { other_than: 1 }
end
