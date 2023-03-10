class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :category
      t.string :title
      t.string :description
      t.string :address
      t.integer :price, default: 10
      t.integer :duration, default: 1
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
