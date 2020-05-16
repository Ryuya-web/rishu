class AddRateToLesson < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :rate, :float, null: false, default: 0
  end
end
