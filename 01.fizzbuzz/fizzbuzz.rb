#!/usr/bin/env ruby

#1~100を表示
one_to_hundred = (1..100)

one_to_hundred.each do |number|
  #各数字を３、５、１５の倍数かどうか判断
  #各々の倍数の時にfizz,buzz,fizzbuzzと表記
  #公倍数を先に処理しifから抜ける
  mult_x = 3
  mult_y = 5
  if number % (mult_x * mult_y) < 1
    puts "fizzbuzz" 
    next
  elsif number % mult_x < 1
    puts "fizz"
    next
  elsif number % mult_y < 1
    puts "buzz"
    next
  end
  puts number
end
