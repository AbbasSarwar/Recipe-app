class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :foods
  has_many :recipes
  has_many :through_recipes, through: :recipes, source: :recipe_foods
  has_many :through_food, through: :foods, source: :recipe_foods

  validates :name, presence: true
end
