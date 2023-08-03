class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients


  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
  attribute :public, :boolean, default: false
  validates :user, presence: true
end
