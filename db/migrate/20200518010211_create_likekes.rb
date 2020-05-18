class CreateLikekes < ActiveRecord::Migration[5.2]
  def change
    create_table :likekes do |t|
      t.references :lessonke, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
