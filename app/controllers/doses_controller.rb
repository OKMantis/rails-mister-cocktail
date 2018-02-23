class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new

  end

  def create
    @ingredient = Ingredient.find(params[:dose][:ingredient])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to @dose.cocktail
    else
      render :new
    end
  end

  def update
    @dose = Dose.find(params[:cocktail_id])
    if @dose.update(dose_params)
    redirect_to redirect_to cocktail_path
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :amount)
  end
end
