class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:user).where(public: true).order(created_at: :desc)
  end
end
