class CreateLikesos < ActiveRecord::Migration[5.2]
  def change
    create_table :likesos do |t|
      t.references :lessonso, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
