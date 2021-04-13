class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :sport_nice
      t.string :teams
      t.string :home_team
      t.datetime :commence_time
      t.string :sites
      t.references :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
