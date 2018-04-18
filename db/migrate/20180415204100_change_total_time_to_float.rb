class ChangeTotalTimeToFloat < ActiveRecord::Migration[5.1]
  def change
    remove_column :countdowns, :total_time
    add_column :countdowns, :total_time, :float
  end
end
