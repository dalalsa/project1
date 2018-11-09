class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :title
      t.string :image
      t.string :description
      t.string :animal_type
      t.string :gender
      t.date :dob
      t.string :city
      t.string :location
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
