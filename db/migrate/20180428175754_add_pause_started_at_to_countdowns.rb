class AddPauseStartedAtToCountdowns < ActiveRecord::Migration[5.1]
  def change
    add_column :countdowns, :pause_started_at, :datetime
  end
end
