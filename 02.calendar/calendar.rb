#!/usr/bin/env ruby
require "date"
require "optparse"
def calendar_expression(year: Date.today.year, month: Date.today.month)
  puts "       #{month}月 #{year}"
  puts "日 月 火 水 木 金 土"
  #今月の最初の日と最後の日を求めて、最初の日から最後の日まで順番に表示しよう。
  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)
  this_months_days = (first_day..last_day)
  this_months_days.each do |day|
    #初日はインデントを決定するため、場合分けをする。日曜日→1、月曜日→4,火曜日→６
    if day == (first_day && day.sunday?)
      print " "
      print((day).day)
      next
    elsif day == first_day
      (1 + 3*(day.wday)).times do
        print " "
      end
      print((day).day)
      next
    end
  #土曜日を表示した後に改行を入れれば大体完成です。
    if day.sunday?
      if (day).day < 10
        puts " "
        print " "
        print((day).day)
        next
      end
      puts " "
      print((day).day)
      next
    else
      if (day).day < 10
        print " "
      end
      print " "
      print((day).day)
    end
  end
end

opt =ARGV.getopts("y:", "m:")
if !opt["y"] && !opt["m"]#optionの設定がない時
  calendar_expression
elsif !opt["m"] && (opt["y"] != "") #yのみ設定がある時
  year = opt["y"].to_i
  calendar_expression(year:year)
elsif !opt["y"] && (opt["m"] != "") #mのみ設定がある時
  month = opt["m"].to_i
  calendar_expression(month:month)
else (opt["y"] != "")&& (opt["m"] != "")#ym両方の設定がある時
  year = opt["y"].to_i
  month =  opt["m"].to_i
  calendar_expression(year:year,month:month)
end
