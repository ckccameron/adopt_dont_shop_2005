require 'rails_helper'

RSpec.describe "shelters show page" do
  it "can see single shelter based on id" do
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

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content("Address: #{shelter_1.address}")
    expect(page).to have_content("City: #{shelter_1.city}")
    expect(page).to have_content("State: #{shelter_1.state}")
    expect(page).to have_content("Zip: #{shelter_1.zip}")
    expect(page).not_to have_content(shelter_2.name)
  end
end
