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
    shots << 10 - shots.last
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
  point += frame.sum

  if index < 9

    if frame[0] == 10
      point += if frames[index + 1][0] == 10
                 frames[index + 1][0] + frames[index + 2][0]
               else
                 frames[index + 1].sum
               end

    elsif frame.sum == 10 && frame[0] != 10
      point += frames[index + 1][0]
    end
  elsif index == 9

    point += frames[10].last if (frame[0] == 10 || frame.sum == 10) && (frames[10].size == 3 && frames[10].sum > 10)
  end
end

puts point
