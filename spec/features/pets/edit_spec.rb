require 'rails_helper'

RSpec.describe "update pet" do
  it "allows user to update info for a pet" do
    shelter_2 = Shelter.create(name: "MaxFund Animal Adoption Center")

    pet_1 = Pet.create(image: "https://animalbehaviourbusiness.com/wp-content/uploads/2018/02/smiling-pitbull-2.png",
                      name: "Chappelle",
                      approximate_age: "2 years old",
                      sex: "Male",
                      shelter_id: shelter_2.id,
                      description: "Pitbull",
                      available_for_adoption: "Yes")

    visit "/pets/#{pet_1.id}"
    expect(page).to have_content(pet_1.name)

    click_link "Update Pet"
    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

    fill_in :name, with: "Pryor"
    fill_in :approximate_age, with: "3 years old"

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("Pryor")
    expect(page).to have_content("3 years old")
  end
end
