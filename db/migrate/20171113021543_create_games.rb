class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :level
      t.string :operation
      t.string :time
      t.integer :correct_answer
      t.references :child, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
