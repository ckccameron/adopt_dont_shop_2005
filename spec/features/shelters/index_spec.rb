require 'rails_helper'

RSpec.describe "shelters index page" do
  it "allows user to see name of each shelter in the system" do
    shelter_1 = Shelter.create(name: "Denver Dumb Friends League")
    shelter_2 = Shelter.create(name: "MaxFund Animal Adoption Center")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  # it "provides user with individual links for each shelter's edit page" do
  #   shelter_1 = Shelter.create(name: "Denver Dumb Friends League")
  #   shelter_2 = Shelter.create(name: "MaxFund Animal Adoption Center")
  #
  #   visit "/shelters"
  #   expect(page).to have_link("Edit Shelter")
  #
  #   click_link "Edit Shelter"
  #   expect(current_path).to eq("/shelters/#{shelter_2.id}/edit")
  # end
end
