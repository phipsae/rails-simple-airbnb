class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit]
  def index
    @flats = Flat.all
  end

  def show; end

  def edit; end

  def update
    @flat.update(flat_params)
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night)
  end
end
