# frozen_string_literal: true

require 'minitest/autorun'
require './lib/shot'

class ShotTest < Minitest::Test
  def test_number_to_score
    assert_equal 1, Shot.new('1').score
    assert_equal 9, Shot.new('9').score
  end

  def test_x_to_score
    assert_equal 10, Shot.new('X').score
  end
end

class FrameTest < Minitest::Test
  def test_frame_to_score
    assert_eqal 1, Frame.new('1,0').score
  end
end
