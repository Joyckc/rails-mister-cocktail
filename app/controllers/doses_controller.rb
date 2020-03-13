class DosesController < ApplicationController
  before_action :set_cocktail
  def new
    # raise
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create #action has no view
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail # you can do this because you have the belongs to cocktail inside of the dose model
    if @dose.save
        redirect_to cocktail_path(@cocktail)
    else
       # render plain "it's not saved"
       render :new
    end
  end

  def destroy #action has no view
    @dose = Dose.find(params[:id])
    @dose.destroy
     # redirect_to cocktails_path
     redirect_to cocktail_path(@dose.cocktail)

  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
