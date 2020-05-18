class CreateLikesyos < ActiveRecord::Migration[5.2]
  def change
    create_table :likesyos do |t|
      t.references :lessonsyo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
