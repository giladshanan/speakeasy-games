class Countdown < ApplicationRecord
  belongs_to :purchased_game, optional: true

  def time_remaining
    (self.total_time * 3600) - (Time.current.to_i - self.created_at.to_i)
  end

end

# total_time
# initial_lockout
# lockout_increment
# guesses
# code
# seconds

