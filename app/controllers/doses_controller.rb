class DosesController < ApplicationController
  before_action :set_cocktail, except: %i[destroy]


  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to cocktail_path(@cocktail), notice: 'Oh no! Something went wrong :O Please try again!'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail), notice: 'Ingredient deleted'
  end

  private

  def dose_params
    params.require(:dose).permit(:measurement, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
