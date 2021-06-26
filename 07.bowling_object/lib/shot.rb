# frozen_string_literal: true

class Shot
  def initialize(number_or_x)
    @score = number_or_x
  end

  def score
    if @score == 'X'
      @score = 10
    else
      @score.to_i
    end
  end
end
