class AddPauseEndedAtToCountdowns < ActiveRecord::Migration[5.1]
  def change
    add_column :countdowns, :pause_ended_at, :datetime
  end
end
