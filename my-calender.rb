require 'date'

module  Calendar
  def beggining_of_month
    Date.new(year, month, 1)
  end

  def end_of_month
    Date.new(year, month, -1)
  end
end

Class Date 
  include Calendar
end

today = Date.today
start_day_of_month = today.beggining_of_month.wday

days = (today.beggining_of_month..today.end_of_month).map(&:day)
start_day_of_month.times { days.unshift('') }

puts("      #{today.strftime('%B %Y')}")
puts('日 月 火 水 木 金 土')
days.each.with_index(1) do |day, i|
  print(day.to_s.rjust(3))
  print("\n") if i % 7 == 0
end
puts("\n")

