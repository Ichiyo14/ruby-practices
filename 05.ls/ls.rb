# frozen_string_literal: true

require 'optparse'
require 'etc'
require 'date'

def main
  opt = ARGV.getopts('a', 'l', 'r')
  current_dir = if opt['a']
                  Dir.glob('*', File::FNM_DOTMATCH).sort
                else
                  Dir.glob('*').sort
                end
  current_dir.reverse! if opt['r']
  if opt['l']
    print 'total'
    total_number = current_dir.sum { |file_name| File.stat(file_name).blocks }
    puts " #{total_number}"
    l_command(current_dir)
  else
    three_rows_order(current_dir)
  end
end

def l_command(current_dir)
  current_dir.each do |file_name|
    file_mode = format('%06d', File.stat(file_name).mode.to_s(8))
    file_format = { '01' => 'p', '02' => 'c', '04' => 'd', '06' => 'b', '10' => '-', '12' => 'l', '14' => 's' }
    file_permission = { '7' => 'rwx', '6' => 'rw-', '5' => 'r-x', '4' => 'r--', '3' => '-wx', '2' => '-w-', '1' => '--x', '0' => '---' }
    print file_format[file_mode.slice(/(^\d{2})/)]
    print file_permission[file_mode.slice(/(^\d{3})(\d{1})(\d{1})(\d{1})/, 2)]
    print file_permission[file_mode.slice(/(^\d{3})(\d{1})(\d{1})(\d{1})/, 3)]
    print "#{file_permission[file_mode.slice(/(^\d{3})(\d{1})(\d{1})(\d{1})/, 4)]} "
    print "#{format('%2d', File.stat(file_name).nlink)} " # ハードリンクの数
    print "#{Etc.getpwuid(File.stat(file_name).uid).name}  "
    print "#{Etc.getgrgid(File.stat(file_name).gid).name} "
    print "#{format('%5d', File.stat(file_name).size)} " # バイト数
    print DateTime.parse(File.stat(file_name).mtime.to_s).strftime('%b %e %H:%M')
    print " #{file_name}\n"
  end
end

def three_rows_order(files)
  files << ' ' until (files.size % 3).zero?
  slice_files = files.each_slice(files.size / 3).to_a
  slice_files.each do |column_files|
    zenkaku_double_count = proc { |chars| chars.length + chars.chars.count - chars.chars.count(&:ascii_only?) }
    @max_long_name_file = column_files.max_by { |file| zenkaku_double_count.call(file) }
    @max_long_name_file_length = zenkaku_double_count.call(@max_long_name_file)
    column_files.map! do |file|
      file + ' ' * (@max_long_name_file_length - zenkaku_double_count.call(file) + 1)
    end
  end
  slice_files.transpose.each do |three_set_files|
    three_set_files.each { |file| print file }
    print "\n"
  end
end

main
