# frozen_string_literal: true

class Shot
  def initialize(mark)
    @mark = mark
  end

  def score
    if @mark == 'X'
      10
    elsif @mark.nil?
      nil
    else
      @mark.to_i
    end
  end
end
