class RenameStartedAtToTimeRemaining < ActiveRecord::Migration[5.1]
  def change
    rename_column :countdowns, :started_at, :time_remaining

  end
end
