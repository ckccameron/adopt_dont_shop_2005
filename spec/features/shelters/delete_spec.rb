require 'rails_helper'

RSpec.describe "delete a shelter" do
  it "allows user to delete a shelter" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                              address: "2080 S. Quebec St",
                              city: "Denver",
                              state: "CO",
                              zip: "80231")
    shelter_2 = Shelter.create(name: "MaxFund Animal Adoption Center",
                              address: "1005 Galapago St",
                              city: "Denver",
                              state: "CO",
                              zip: "80204")
    shelter_3 = Shelter.create(name: "Colorado Puppy Rescue",
                              address: "10021 E Iliff Ave",
                              city: "Aurora",
                              state: "CO",
                              zip: "80247")

    visit "/shelters"
    expect(page).to have_content(shelter_1.name)

    visit "/shelters/#{shelter_1.id}"

    click_link "Delete Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Dumb Friends League")
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_3.name)
  end
end
