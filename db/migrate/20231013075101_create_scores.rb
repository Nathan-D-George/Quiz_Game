class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.integer :score, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true

    end
  end
end
