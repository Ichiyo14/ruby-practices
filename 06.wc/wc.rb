#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

def main
  file_names = ARGV
  if file_names
    for_file_wc(file_names)
  else
    text = $stdin.read
    print text.count("\n")
  end
end

def for_file_wc(file_names)
  opt = ARGV.getopts('l')
  total_line = 0
  total_word = 0
  total_byte = 0
  file_names.each.with_index(1) do |file, index|
    text = ''
    File.open(file) { |f| text = f.read }
    line_number = text.count("\n")
    word_number = text.split.count
    byte_number = text.bytesize
    total_line += line_number
    total_word += word_number
    total_byte += byte_number
    if opt['l']
      puts "#{line_number.to_s.rjust(8)} #{file}"
      puts "#{total_line.to_s.rjust(8)} total" if index == file_names.length && index != 1
    else
      puts "#{line_number.to_s.rjust(8)}#{word_number.to_s.rjust(8)}#{byte_number.to_s.rjust(8)} #{file}"
      puts "#{total_line.to_s.rjust(8)}#{total_word.to_s.rjust(8)}#{total_byte.to_s.rjust(8)} total" if index == file_names.length && index != 1
    end
  end
end

main
