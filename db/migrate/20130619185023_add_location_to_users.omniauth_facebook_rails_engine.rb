# This migration comes from omniauth_facebook_rails_engine (originally 20130619184636)
class AddLocationToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :location
    end
  end
end
