class AddAddressToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :address, :string
  end
end
