class AddAttributesToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :description, :string
    add_column :pets, :available_for_adoption, :string
  end
end
