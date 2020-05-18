class CreateLikekyos < ActiveRecord::Migration[5.2]
  def change
    create_table :likekyos do |t|
      t.references :lessonkyo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
