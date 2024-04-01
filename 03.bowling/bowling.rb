#!/usr/bin/env ruby
# frozen_string_literal: true

STRIKE_SCORE = 10
score = ARGV[0]
scores = score.split(',')

shots = []
scores.each do |s|
  case s
  when 'X'
    shots << STRIKE_SCORE
    shots << 0
  when '/'
    shots << STRIKE_SCORE - shots.last
  else
    shots << s.to_i
  end
end

frames = shots.each_slice(2).to_a

point = 0
frames.each_with_index do |frame, index|
  point += frame.sum
  next_frame = frames[index + 1]

  if index < 9

    if frame[0] == STRIKE_SCORE
      point += if next_frame[0] == STRIKE_SCORE
                 next_frame[0] + frames[index + 2][0]
               else
                 next_frame.sum
               end

    elsif frame.sum == STRIKE_SCORE && frame[0] != STRIKE_SCORE
      point += next_frame[0]
    end
  elsif index == 9

    point += frames[10].last if (frame[0] == STRIKE_SCORE || frame.sum == STRIKE_SCORE) && (frames[10].size == 3 && frames[10].sum > STRIKE_SCORE)
  end
end

puts point
