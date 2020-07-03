require 'rails_helper'

RSpec.describe "update shelter" do
  it "allows user to update info for a shelter" do
    shelter_1 = Shelter.create(name: "Dumb Friends League",
                              address: "2080 S. Quebec St",
                              city: "Denver",
                              state: "CO",
                              zip: "80231")

    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content("Dumb Friends League")

    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in :name, with: "Humans Are The Dumb Ones League"

    click_on "Submit"

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Humans Are The Dumb Ones League")
    expect(page).to have_content("2080 S. Quebec St")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
    expect(page).to have_content("80231")
    expect(page).not_to have_content("Dumb Friends League")
  end
end
