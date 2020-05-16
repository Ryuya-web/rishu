class RemoveRateFromLessons < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :rate, :float
  end
end
