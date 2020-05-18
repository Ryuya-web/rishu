class CreateLikenos < ActiveRecord::Migration[5.2]
  def change
    create_table :likenos do |t|
      t.references :lessonno, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
