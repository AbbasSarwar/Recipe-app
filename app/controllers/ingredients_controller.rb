class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ingredient, only: %i[show edit update destroy]

  def index
    @ingredients = current_user.ingredients.all
  end

  def show; end

  def new
    @ingredient = current_user.ingredients.build
    @recipe = current_user.recipes.find(params[:recipe_id])
    @foods = Food.all
  end

  def create
    @ingredient = current_user.ingredients.build(ingredient_params)
    @recipe = current_user.recipes.find(params[:recipe_id])
    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to recipe_path(@recipe), notice: 'Ingredient saved successfully' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def edit
    @ingredient = current_user.ingredients.find(params[:id])
    @recipe = current_user.recipe
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to ingredient_url(@ingredient), notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to recipe_ingredient_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ingredient_params
    params.require(:ingredient).permit(:quantity, :food_id, :recipe_id)
  end
      
end
