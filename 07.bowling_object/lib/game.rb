# frozen_string_literal: true

class Game
  def initialize(marks)
    @frames = marks_to_array_per_frame_object(marks)
  end

  def print_score
    total_scores_before_addition + bounus_score
  end

  private

  def marks_to_array_per_frame_object(marks)
    split_marks = marks.split(',')
    frames = []
    shots = []
    split_marks.each.with_index do |mark, shot_i|
      if frames.size == 9 # 10フレームの時
        shots << mark # 最後のショットの時
        frames << shots if shot_i == split_marks.size - 1
        next
      end
      if mark == 'X'
        frames << ['X']
      else
        shots << mark
        if shots.length == 2 # 2回投げたら1フレームだよ
          frames << shots
          shots = []
        end
      end
    end
    to_frame_objects(frames)
  end

  def to_frame_objects(frames)
    frames.map do |frame|
      Frame.new(frame[0], frame[1], frame[2])
    end
  end

  def total_scores_before_addition
    total_scores_before_addition = 0
    @frames.each do |frame|
      total_scores_before_addition += frame.score
    end
    total_scores_before_addition
  end

  def bounus_score
    bounus_score = 0
    @frames.each.with_index do |frame, index|
      next_frame_first_shot = @frames[index + 1]&.first_shot.to_i
      bounus_score += next_frame_first_shot + (@frames[index + 1]&.second_shot || @frames[index + 2]&.first_shot.to_i) if frame.strike?
      bounus_score += next_frame_first_shot if frame.spare?
    end
    bounus_score
  end
end
