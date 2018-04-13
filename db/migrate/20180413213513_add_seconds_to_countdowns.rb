class AddSecondsToCountdowns < ActiveRecord::Migration[5.1]
  def change
    remove_column :countdowns, :seconds_remaining
    add_column :countdowns, :seconds, :integer
  end
end
