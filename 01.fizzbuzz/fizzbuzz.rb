(1..20).each do |number|
  def fizzbuzz(number)
    if number % 3 == 0 && number % 5 == 0
      puts "FizzBuzz"    
    elsif number % 3 == 0
      puts "Fizz"
    elsif number % 5 == 0
      puts "Buzz"
    elseを
      puts number
    end
  end  
  puts fizzBuzz(num) 
end
