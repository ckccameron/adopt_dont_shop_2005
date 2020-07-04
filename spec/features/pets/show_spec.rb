require 'rails_helper'

RSpec.describe "pet show page" do
  it "allows user to see a pet's image, name, description, approximate age, sex and adoption status" do
    shelter_2 = Shelter.create(name: "MaxFund Animal Adoption Center")

    pet_1 = Pet.create(image: "https://images.app.goo.gl/781WD1vckvbeUfNy5",
                      name: "Chappelle",
                      approximate_age: "2 years old",
                      sex: "Male",
                      shelter_id: shelter_2.id,
                      description: "Pitbull",
                      available_for_adoption: "Yes")

    visit "/pets/#{pet_1.id}"

    expect(page.find("img#pet-image-#{pet_1.id}"))
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.available_for_adoption)
  end
end
