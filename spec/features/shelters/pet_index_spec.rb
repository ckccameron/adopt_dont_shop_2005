require 'rails_helper'

RSpec.describe "shelter_pets index page" do
  it "allows user to see pets that can be adopted from each shelter" do
    shelter_2 = Shelter.create(name: "MaxFund Animal Adoption Center")
    shelter_3 = Shelter.create(name: "Colorado Puppy Rescue")

    pet_1 = Pet.create(image: "https://animalbehaviourbusiness.com/wp-content/uploads/2018/02/smiling-pitbull-2.png",
                      name: "Chappelle",
                      approximate_age: "2 years old",
                      sex: "Male",
                      description: "Pitbull",
                      shelter_id: shelter_2.id)
    pet_2 = Pet.create(image: "https://static.boredpanda.com/blog/wp-content/uploads/2016/07/smiling-dog-stray-pit-bull-adopted-brinks-14.jpg",
                      name: "Rose",
                      approximate_age: "2 months old" ,
                      sex: "Female",
                      description: "Pitbull",
                      shelter_id: shelter_3.id)

    visit "/shelters/#{shelter_2.id}/pets"

    expect(page.find("img#pet-image-#{pet_1.id}"))
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to_not have_content(pet_2.name)
  end
end
