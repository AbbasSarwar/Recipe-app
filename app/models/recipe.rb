class Recipe < ApplicationRecord
  belongs_to :user

  has_many :recipe_foods

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: true }
  validates :cooking_time, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validatable :public, presence: true
  validates :user, presence: true
end
