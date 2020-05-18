class CreateLikeses < ActiveRecord::Migration[5.2]
  def change
    create_table :likeses do |t|
      t.references :lessonse, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
