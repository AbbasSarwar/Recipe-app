class FoodsController < ApplicationController
  def index
    @foods = current_user.foods.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(food_params.merge(user_id: current_user.id))

    respond_to do |format|
      format.html do
        if @food.save
          redirect_to foods_path
        else
          redirect_to new_food_path
        end
      end
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
