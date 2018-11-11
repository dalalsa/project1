class AnimalsController < ApplicationController
  def index
    @animals = Animal.where(status: params[:search])
  end

  def show
    @animal = Animal.find_by(id: params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    animal = current_user.animals.create(animal_params)
    #animal = animal.create(animal_params)
    redirect_to animal_path(animal)
  end

  def edit
  end

  private

  def animal_params
    params.require(:animal).permit(:title, :description, :image, :animal_type, :gender, :dob, :city, :location, :status)
  end
end
