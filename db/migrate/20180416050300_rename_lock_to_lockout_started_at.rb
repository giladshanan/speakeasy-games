class RenameLockToLockoutStartedAt < ActiveRecord::Migration[5.1]
  def change
    rename_column :countdowns, :lock_started_at, :lockout_started_at
  end
end
