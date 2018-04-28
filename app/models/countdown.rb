class Countdown < ApplicationRecord
  belongs_to :purchased_game, optional: true
  validates :purchased_game, uniqueness: true

  def time_remaining
    output = self.created_at.to_i + self.total_time - Time.current.to_i
    output >= 0 ? output : 0
  end

  def lockout_remaining
    output = (self.lockout_seconds) - (Time.current.to_i - self.lockout_started_at.to_i)
    output >= 0 ? output : 0
  end

  def pause_duration
    if self.pause_started_at.to_i > self.pause_ended_at.to_i
      ending_time = Time.current.to_i
    else
      ending_time = self.pause_ended_at.to_i
    end
    output = (ending_time - self.pause_started_at.to_i)
  end

end

# total_time
# lockout_seconds
# lockout_increment
# lockout_started_at
# guesses
# code
# seconds

