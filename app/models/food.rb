class Food < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods

  validates :name, presence: true
  validates :measurement_unit, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
