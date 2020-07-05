# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.create(name: "Dumb Friends League", address: "2080 S. Quebec St", city: "Denver", state: "CO", zip: "80231")

Shelter.create(name: "MaxFund Animal Adoption Center", address: "1005 Galapago St", city: "Denver", state: "CO", zip: "80204")

Shelter.create(name: "Colorado Puppy Rescue", address: "10021 E Iliff Ave", city: "Aurora", state: "CO", zip: "80247")

Shelter.create(name: "PawsCo Headquarters", address: "8200 E Pacific Pl", city: "Denver", state: "CO", zip: "80231")

Pet.create(image: "https://animalbehaviourbusiness.com/wp-content/uploads/2018/02/smiling-pitbull-2.png", name: "Chappelle", approximate_age: "2 years old", sex: "Male", shelter_id: 2, description: "Pitbull", available_for_adoption: "Yes")

Pet.create(image: "https://static.boredpanda.com/blog/wp-content/uploads/2016/07/smiling-dog-stray-pit-bull-adopted-brinks-14.jpg", name: "Rose", approximate_age: "2 months old" , sex: "Female", shelter_id: 3, description: "Pitbull", available_for_adoption: "Yes")

Pet.create(image: "http://stjoemo.animalshelternet.com/pics/416204-1.jpg", name: "Colombiana", approximate_age: "4 months old" , sex: "Female", shelter_id: 4, description: "Pitbull", available_for_adoption: "Yes")

Pet.create(image: "https://www.rover.com/blog/wp-content/uploads/2015/10/pittie-smile.jpg", name: "Belle", approximate_age: "1 year old" , sex: "Female", shelter_id: 4, description: "Pitbull", available_for_adoption: "Yes")
