class RenameTimeRemainingToSecondsRemaining < ActiveRecord::Migration[5.1]
  def change
    rename_column :countdowns, :time_remaining, :seconds_remaining
  end
end
