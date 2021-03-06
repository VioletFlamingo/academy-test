class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @cities = City.all.page(params[:page]).per(5)
    respond_with(@cities)
  end

  def show
    respond_with(@city)
  end

  def new
    @city = City.new
    respond_with(@city)
  end

  def edit
  end

  def create
    @city = City.new(city_params)
    @city.save
    respond_with(@city)
  end

  def update
    @city.update(city_params)
    respond_with(@city)
  end

  def destroy
    User.where(city_id: @city).each do |u|
      u.city_id = nil
      u.save
    end

    @city.destroy
    respond_with(@city)
  end

  private
  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :short_name)
  end
end
