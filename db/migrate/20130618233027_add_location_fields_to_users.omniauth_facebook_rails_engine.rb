# This migration comes from omniauth_facebook_rails_engine (originally 20130618230000)
class AddLocationFieldsToUsers < ActiveRecord::Migration
  def change
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
