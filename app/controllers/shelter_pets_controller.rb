class ShelterPetsController < ApplicationController
  def index
    @shelter_pets = ShelterPet.all
  end
end
