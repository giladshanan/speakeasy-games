class RenameLockoutAttemptsToGuesses < ActiveRecord::Migration[5.1]
  def change
    rename_column :countdowns, :lockout_attempts, :guesses
  end
end
