class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ンー]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ン一]+\z/ }
  validates :birthday, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
