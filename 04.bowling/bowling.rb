#!/usr/bin/env ruby
# frozen_string_literal: true

# 引数を取る
score = ARGV[0]

scores = score.split(',')
frames = []
shots = []
scores.each.with_index do |s, shot_i|
  score = s.to_i
  if frames.size == 9 # 10フレームの時
    score = 10 if s == 'X'
    shots << score
    frames << shots if shot_i == scores.size - 1 # 最後のショットの時
    next
  end
  # 〜9フレーム目の時
  # ストライクの時
  if s == 'X' && frames.size < 9
    frames << [10]
  else # 他の時
    shots << score
    if shots.length == 2 # 2回投げたら1フレームだよ
      frames << shots
      shots = []
    end
  end
end

total_points_before_addition = 0
spare_points_add = 0
strike_points_add = 0

frames.each.with_index do |(first_shot, second_shot, third_shot), frame_i|
  total_points_before_addition += first_shot + (second_shot || 0) + (third_shot || 0) # 加算前の数値
  if !second_shot.nil? && (first_shot + second_shot == 10) && frame_i < 9 # スペアの加算値
    spare_points_add += frames[frame_i + 1][0]
  elsif second_shot.nil? && first_shot == 10 && frame_i < 9 # ストライクの加算値
    strike_points_add += frames[frame_i + 1][0] + (frames[frame_i + 1][1] || frames[frame_i + 2][0]) # 1投目しか無いときは次の１投目を参照
  end
end
puts total_points_before_addition + spare_points_add + strike_points_add
