class DosesController < ApplicationController
before_action :find_cocktail, only: [:new]

  def new
    @ingredient = Ingredient.new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = find_cocktail
    @dose.save
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

# I have to get the dose
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
