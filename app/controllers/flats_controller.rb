class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :destroy, :update]
  def index
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name LIKE ?","%#{params[:query]}%")
      redirect_to flats_path
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @flats = Flat.all
    end
  end

  def show; end

  def edit
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name LIKE ?","%#{params[:query]}%")
      render :index
    end
  end

  def new
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name LIKE ?","%#{params[:query]}%")
      render :index
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @flat = Flat.new
    end
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def update
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests, :picture_url)
  end
end
