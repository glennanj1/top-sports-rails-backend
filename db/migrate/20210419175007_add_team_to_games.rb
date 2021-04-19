class AddTeamToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :team_1, :string
    add_column :games, :team_2, :string
  end
end
