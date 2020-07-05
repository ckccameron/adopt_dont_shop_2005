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

  def shelter_id
    params.permit(:shelter_id)[:shelter_id]
  end
end
