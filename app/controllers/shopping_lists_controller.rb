class ShoppingListsController < ApplicationController
  def index
    @recipe = current_user.recipes.find_by(id: params[:recipe_id])
    @total_price = 0
    @food_items = []
    @ingredients = Ingredient.where(recipe: @recipe)
    @ingredients.each do |ingredient|
      quantity = ingredient.food.quantity - ingredient.quantity
      @food_items.push(ingredient)
      @total_price += quantity * ingredient.food.price
    end
    @total = Ingredient.all.where(recipe: @recipe).count
  end
end
