class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @ingredient = Ingredient.new
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def strong_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
