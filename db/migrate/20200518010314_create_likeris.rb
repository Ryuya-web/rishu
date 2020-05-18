class CreateLikeris < ActiveRecord::Migration[5.2]
  def change
    create_table :likeris do |t|
      t.references :lessonri, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
