class AddOdds1ToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :odds1, :string
  end
end
