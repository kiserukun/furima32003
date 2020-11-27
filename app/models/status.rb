class Status < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_status

  validates :genre_status_id, presence: true, numericality: { other_than: 1 }
end
