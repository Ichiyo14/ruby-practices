#!/usr/bin/env ruby

#1~100を表示
one_to_hundred = (1..100)

one_to_hundred.each do |number|
  #各数字を３、５、１５の倍数かどうか判断
  #各々の倍数の時にfizz,buzz,fizzbuzzと表記
  #公倍数を先に処理しifから抜ける
  mult_x = 3
  mult_y = 5
  if number % (mult_x * mult_y) == 0
    puts "fizzbuzz" 
  elsif number % mult_x == 0
    puts "fizz"
  elsif number % mult_y == 0
    puts "buzz"
  else 
    puts number
  end
end
