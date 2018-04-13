class AddStartTimeAndTimeStampsToCountdowns < ActiveRecord::Migration[5.1]
  def change
    add_column :countdowns, :started_at, :datetime
    add_column :countdowns, :created_at, :datetime, null: false
    add_column :countdowns, :updated_at, :datetime, null: false
  end
end
