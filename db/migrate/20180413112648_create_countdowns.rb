class CreateCountdowns < ActiveRecord::Migration[5.1]
  def change
    create_table :countdowns do |t|
      t.integer :total_time
      t.integer :initial_lockout
      t.integer :lockout_increment
      t.integer :lockout_attempts
      t.string :code
    end
  end
end
