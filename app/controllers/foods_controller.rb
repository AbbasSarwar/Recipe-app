class FoodsController < ApplicationController
  def index
    @foods = current_user.foods.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)

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

  def destroy
    @food = current_user.foods.find(params[:id])
    return unless @food.destroy

    flash[:notice] = "Deleted succesfully #{@food.name}"
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
