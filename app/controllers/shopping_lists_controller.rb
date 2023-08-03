class ShoppingListsController < ApplicationController
    def index
        @recipes = current_user.recipes
       #@recipe = Recipe.find(params[:recipe_id])
       @total_price = 0
       @food_items = []
       #@ingredients = Ingredient.where(recipe_id: @recipe.id)
       @ingredients = Ingredient.where(recipes: @recipes)
         @ingredients.each do |ingredient|
         quantity = ingredient.food.quantity - ingredient.quantity
         @food_items.push(ingredient)
         @total_price += quantity * ingredient.food.price
       end
      #@total = Ingredient.all.where(recipe_id: @recipe.id).count
      @total = Ingredient.all.where(recipes: @recipes).count
 end
end
