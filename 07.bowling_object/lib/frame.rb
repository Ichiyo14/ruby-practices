# frozen_string_literal: true

class Frame
  MAX_PIN = 10
  FRAME_NUMBER = 10
  ORDINARY_THROWING_NUMBER_PER_FRAME = 2
  attr_reader :first_shot, :second_shot

  def initialize(first_mark, second_mark = nil, third_mark = nil)
    @first_shot = Shot.new(first_mark).score
    @second_shot = Shot.new(second_mark)&.score
    @third_shot = Shot.new(third_mark)&.score
  end

  class << self
    def one_before_last_frame?(frame_time)
      frame_time == FRAME_NUMBER - 1
    end
    def enough_shots?(shot_time)
      shot_time == ORDINARY_THROWING_NUMBER_PER_FRAME
    end
  end
  def score
    @first_shot + @second_shot.to_i + @third_shot.to_i
  end

  def strike?
    @first_shot == MAX_PIN
  end

  def spare?
    (@first_shot + @second_shot.to_i) == MAX_PIN && @first_shot != MAX_PIN
  end
end
