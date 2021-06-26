# frozen_string_literal: true

class Frame
  attr_reader :first_shot, :second_shot
  def initialize(first_mark, second_mark = nil, third_mark = nil)
    @first_shot = Shot.new(first_mark).score
    @second_shot = Shot.new(second_mark)&.score
    @third_shot = Shot.new(third_mark)&.score
  end

  def score
    @first_shot + @second_shot.to_i + @third_shot.to_i
  end

  def strike?
    @first_shot == 10
  end

  def spare?
    (@first_shot + @second_shot.to_i) == 10 && @first_shot != 10
  end
end
