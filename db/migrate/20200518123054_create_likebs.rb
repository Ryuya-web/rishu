class CreateLikebs < ActiveRecord::Migration[5.2]
  def change
    create_table :likebs do |t|
      t.references :lessonb, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
