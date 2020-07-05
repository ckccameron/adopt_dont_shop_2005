class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new(shelter_id: params["shelter_id"])
  end

  def create
    pet = Pet.new(
      image: params["pet"]["image"],
      name: params["pet"]["name"],
      approximate_age: params["pet"]["approximate_age"],
      sex: params["pet"]["sex"],
      description: params["pet"]["description"],
      shelter_id: params["shelter_id"],
      adoptable: "Yes"
      )
    if pet.save
      redirect_to "/shelters/#{shelter_id}/pets"
    else
      redirect_to "/shelters/#{shelter_id}/pets/new"
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex)
  end
end
