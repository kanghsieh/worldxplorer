class CreateUsersLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :users_locations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.boolean :visited
      t.boolean :wished

      t.timestamps
    end
  end
end
