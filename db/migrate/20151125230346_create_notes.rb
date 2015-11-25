class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :rating
      t.text :review
      t.boolean :seen
      t.references :user, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
