class CreateTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonials do |t|
      t.text :description
      t.string :author
      t.date :date
      t.references :game, foreign_key: true
      t.timestamps
    end
  end
end