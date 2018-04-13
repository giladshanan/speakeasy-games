class ChangeTimeRemainingToInteger < ActiveRecord::Migration[5.1]
  def change
    def up
      change_column :countdowns, :seconds_remaining, :integer
    end
    def down
      change_column :countdowns, :seconds_remaining, :datetime
    end
  end
end
