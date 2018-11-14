class AnimalsController < ApplicationController
  def index
    if params[:location]
      @animals = Animal.where("city ILIKE '%#{params[:location]}%'")
      # Whatever the user typed in, go through all Animals. If params[:location] appears somewhere in the current animals city field,
      # Include that animal in the results. This is also case insensitive ("riyadh" == "RIYADH" because of ILIKE)
    else
      @animals = Animal.where(status: params[:search])
    end
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
    @animal = Animal.find_by(id: params[:id])
  end

  def adopted
    params[:id]
    # Find the animal with the id of params[:id]
    @animal = Animal.find_by(id: params[:id])

    @animal.update(status: "adopted")

    @animal.save

    # Change the status to "Adopted" on that animal

    # Save the animal

  end

  def returned
    params[:id]
    @animal = Animal.find_by(id: params[:id])
    @animal.update(status: "returned")
    @animal.save

  end

  def update
  end

  private

  def animal_params
    params.require(:animal).permit(:title, :description, :image, :animal_type, :gender, :dob, :city, :location, :status)
  end
end
