class CreateLessonris < ActiveRecord::Migration[5.2]
  def change
    create_table :lessonris do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :teacher_name

      t.timestamps
    end
  end
end
