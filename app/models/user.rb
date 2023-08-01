class User < ApplicationRecord
  before_validation :set_default
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :foods
  has_many :recipes
  has_many :recipe_foods

  def set_default
    self.name = email.split('@')[0]
  end
end
