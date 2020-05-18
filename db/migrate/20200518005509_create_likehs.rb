class CreateLikehs < ActiveRecord::Migration[5.2]
  def change
    create_table :likehs do |t|
      t.references :lessonh, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
