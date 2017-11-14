class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :level
      t.string :operation
      t.string :problem
      t.integer :expected_answer
      t.integer :correct_answer
      t.integer :right_count
      t.integer :tries_count
      t.integer :total_count
      t.string :start_time
      t.string :end_time
      
      t.references :child, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
