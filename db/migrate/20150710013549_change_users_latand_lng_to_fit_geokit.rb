class ChangeUsersLatandLngToFitGeokit < ActiveRecord::Migration
  def change
    rename_column :users, :latitude, :lat
    rename_column :users, :longitude, :lng
  end
end
