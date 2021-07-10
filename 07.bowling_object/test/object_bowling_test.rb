# frozen_string_literal: true

require 'minitest/autorun'
require './lib/shot'
require './lib/frame'
require './lib/game'

class ShotTest < Minitest::Test
  def test_number_to_score
    assert_equal 5, Shot.new('5').score
  end

  def test_x_to_score
    assert_equal 10, Shot.new('X').score
  end
end

class FrameTest < Minitest::Test
  def test_frame_to_score
    assert_equal 1, Frame.new('1', '0').score
    assert_equal 5, Frame.new('2', '3').score
    assert_equal 10, Frame.new('5', '5').score
  end

  def test_frame_to_score_if_score_equal_x
    assert_equal 10, Frame.new('X').score
  end

  def test_if_third_shot
    assert_equal 30, Frame.new('X', 'X', 'X').score
  end
end

class GameTest < Minitest::Test
  def test_game_score
    assert_equal 139, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,6,4,5').print_score
    assert_equal 164, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,X,X').print_score
    assert_equal 300, Game.new('X,X,X,X,X,X,X,X,X,X,X,X').print_score
    assert_equal 107, Game.new('0,10,1,5,0,0,0,0,X,X,X,5,1,8,1,0,4').print_score
    assert_equal 134, Game.new('6,3,9,0,0,3,8,2,7,3,X,9,1,8,0,X,X,0,0').print_score
  end
end
