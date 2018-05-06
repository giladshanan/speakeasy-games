class AddLockStartedAtToCountdowns < ActiveRecord::Migration[5.1]
  def change
    add_column :countdowns, :lock_started_at, :datetime
    rename_column :countdowns, :initial_lockout, :lockout_seconds
  end
end
