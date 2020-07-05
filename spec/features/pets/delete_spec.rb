require 'rails_helper'

RSpec.describe "delete a pet" do
  it "allows user to delete a pet" do
    shelter_2 = Shelter.create(name: "MaxFund Animal Adoption Center")
    shelter_3 = Shelter.create(name: "Colorado Puppy Rescue")

    pet_1 = Pet.create(image: "https://images.app.goo.gl/781WD1vckvbeUfNy5",
                      name: "Chappelle",
                      approximate_age: "2 years old",
                      sex: "Male",
                      shelter_id: shelter_2.id)
    pet_2 = Pet.create(image: "https://images.app.goo.gl/MXQi3ZwYfDMHYEyTA",
                      name: "Rose",
                      approximate_age: "2 months old" ,
                      sex: "Female",
                      shelter_id: shelter_3.id)

    visit "/pets"
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_2.name)

    visit "/pets/#{pet_1.id}"

    click_link "Delete Pet"

    expect(current_path).to eq("/pets")
    expect(page).to have_content(pet_2.name)
    expect(page).to_not have_content(pet_1.name)
  end
end
