class AddTeacherNameToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :teacher_name, :string
  end
end
