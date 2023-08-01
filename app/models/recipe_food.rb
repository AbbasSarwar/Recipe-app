class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true, numericality: {only_integer: true}
  validates :recipe, presence: true
  validates :food, presence: true
end
