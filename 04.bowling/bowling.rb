#!/usr/bin/env ruby
# frozen_string_literal: true

# 引数を取る
score = ARGV[0]

# ストライクなら１つの配列に、それ以外なら２つの配列に入れる
scores = score.split(',')
frames = []
shots = []
scores.each do |s|
  score = s.to_i
  # ストライクの時
  if s == 'X'
    frames << [10]
  else # 他の時
    shots << score
    if shots.length == 2 # 2回投げたら1フレームだよ
      frames << shots
      shots = []
    end
  end
end
# 最後にスペアを出した時
frames << shots unless shots.empty?

total_points_before_addition = 0
spare_points_add = 0
strike_points_add = 0

frames.each.with_index do |(first_shot, second_shot), frame_i|
  total_points_before_addition += first_shot + (second_shot || 0) # 加算前の数値
  if !second_shot.nil? && (first_shot + second_shot == 10) && frame_i < 9 # スペアの加算値
    spare_points_add += frames[frame_i + 1][0]
  elsif second_shot.nil? && first_shot == 10 && frame_i < 9 # ストライクの加算値
    strike_points_add += frames[frame_i + 1][0] + (frames[frame_i + 1][1] || frames[frame_i + 2][0]) # 1投目しか無いときは次の１投目を参照
  end
end
puts total_points_before_addition + spare_points_add + strike_points_add
