class AddDatesToUsersLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :users_locations, :date_visited, :datetime
  end
end
