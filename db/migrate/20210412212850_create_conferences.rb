class CreateConferences < ActiveRecord::Migration[6.1]
  def change
    create_table :conferences do |t|
      t.string :league
      t.string :conference
      t.string :division

      t.timestamps
    end
  end
end
