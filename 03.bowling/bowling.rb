#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')

shots = []
scores.each do |s|
  case s
  when 'X'
    shots << 10
    shots << 0
  when '/'
    shots << 10 - shots.last # スペア
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << s
end

point = 0
frames.each_with_index do |frame, index|
  point += frame.sum # 1投目と2投目の合計を加算

  # ストライク
  if frame[0] == 10 && (index < 9)
    point += frames[index + 1][0] + frames[index + 1][1] # 次のフレームの1投目と2投目を加算
  end

  # スペア
  if frame.sum == 10 && frame[0] != 10 && (index < 9) # ストライクでないとき
    point += frames[index + 1][0] # 次のフレームの1投目のみ加算
  end

  # 10フレーム目
  if index == 9 && (frame[0] == 10 || frame.sum == 10) # ストライクまたはスペアの場合
    # 3投目を打てる
    point += frames[10][0]
  end
end

puts point
