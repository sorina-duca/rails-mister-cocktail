class ReviewsController < ApplicationController


def new
  @cocktail = Cocktail.find(params[:cocktail_id])
  @review = Review.new
end

def create
  @cocktail = Cocktail.find(params[:cocktail_id])
  @review = Review.new(params_review)
  @review.cocktail = @cocktail
  @review.save
  if @review.save
    redirect_to cocktail_path(@cocktail)
  else
    render:new
  end
end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
