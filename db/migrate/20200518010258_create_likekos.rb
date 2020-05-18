class CreateLikekos < ActiveRecord::Migration[5.2]
  def change
    create_table :likekos do |t|
      t.references :lessonko, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
