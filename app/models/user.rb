class User < ApplicationRecord
  before_validation :set_default
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :foods
  has_many :recipes
  has_many :ingredients, through: :recipes

  def set_default
<<<<<<< HEAD
    self.name = email&.split('@')&.first
=======
    self.name = email.split('@')[0] if email.present?
>>>>>>> 47e82916999a2067cd0f179a62012771af8b2bcf
  end
end
