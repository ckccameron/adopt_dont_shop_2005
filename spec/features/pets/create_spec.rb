require 'rails_helper'

RSpec.describe "pet create page" do
  it "can allow user to create a new pet for adoption" do
    shelter_2 = Shelter.create(name: "MaxFund Animal Adoption Center")

    pet_1 = Pet.create(image: "https://images.app.goo.gl/781WD1vckvbeUfNy5",
                      name: "Chappelle",
                      approximate_age: "2 years old",
                      sex: "Male",
                      shelter_id: shelter_2.id,
                      description: "Pitbull",
                      available_for_adoption: "Yes")

    visit "/shelters/#{shelter_2.id}/pets"
    expect(page).to have_content("Available Pets")
    expect(page).to have_content("Chappelle")

    click_on "Create Pet"
    expect(current_path).to eq "/shelters/#{shelter_2.id}/pets/new"
    expect(page).to have_content("Create A New Pet For Adoption")

    fill_in :image, with: "https://images.app.goo.gl/N1njZvNS7kjQefWS6"
    fill_in :name, with: "Guapo"
    fill_in :approximate_age, with: "9 months old"
    fill_in :sex, with: "Male"
    fill_in :description, with: "Pitbull"

    click_on "Create Pet"

    new_pet = Pet.last

    expect(current_path).to eq "/shelters/#{shelter_2.id}/pets"
    expect(page).to have_content("Guapo")
    expect(page).to have_content(new_pet.available_for_adoption)
  end
end
