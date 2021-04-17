class AddOddsToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :odds, :string
  end
end
