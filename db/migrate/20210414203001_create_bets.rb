class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.integer :amount
      t.string :team
      t.integer :odds
      t.datetime :date
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
