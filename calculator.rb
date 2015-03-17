def say(msg)
  puts "==> #{msg}"
end

say "enter the first number"
num1 = gets.chomp

say "enter the second number"
num2 = gets.chomp

say "enter the operator +) add, -) subtract *) multiply /) divide"
operator = gets.chomp

case operator
when "+"
  result = num1.to_i + num2.to_i
when "-"
  result = num1.to_i - num2.to_i
when "*"
  result = num1.to_i * num2.to_i
when "/"
  result = num1.to_f / num2.to_f
end

say "#{num1} #{operator} #{num2} = #{result}"
