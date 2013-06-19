class RemoveLocationFieldsFromUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.remove :ip
      t.remove :city
      t.remove :region
      t.remove :country
      t.remove :country_code
      t.remove :latitude
      t.remove :longitude
      t.remove :timezone
    end
  end

  def down
    change_table :users do |t|
      t.string :ip
      t.string :city
      t.string :region
      t.string :country
      t.string :country_code
      t.string :latitude
      t.string :longitude
      t.string :timezone
    end
  end
end
