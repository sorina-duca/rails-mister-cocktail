class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_cocktail, only: [:show]

  def index
    # pundit
    @cocktails = policy_scope(Cocktail).order(name: :asc)
  end

  def show
    @dose = Dose.new
    @review = Review.new
    authorize @cocktail
  end

  def new
    @cocktail = Cocktail.new
    authorize @cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    authorize @cocktail
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
