#!/usr/bin/env ruby
require 'date'
require 'optparse'

def print_calendar(year, month)
  puts "#{month}月 #{year}".center(21)
  puts "日 月 火 水 木 金 土"

  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)
  print "   " * first_day.wday
  (first_day..last_day).each do |day|
    print day.day.to_s.rjust(3)
    print "\n" if day.saturday?
  end

  puts "\n"
end
current_date = Date.today
year = current_date.year
month = current_date.month

OptionParser.new do |opt|
  # 引数の挙動を定義
  opt.on('-m M', '--month M', Integer) do |m|
    month = m
  end

  opt.on('-y Y', '--year Y', Integer) do |y|
    year = y
  end
  # 定義されたコマンドラインオプションを解析・実行
  opt.parse!(ARGV)
end
print_calendar(year, month)
