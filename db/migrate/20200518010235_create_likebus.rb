class CreateLikebus < ActiveRecord::Migration[5.2]
  def change
    create_table :likebus do |t|
      t.references :lessonbu, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
