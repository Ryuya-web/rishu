class RemoveTeacherIdFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :teacher_id, :integer
  end
end
