# frozen_string_literal: true

require 'etc'
require 'pathname'

class LongFile
  FILE_FORMAT = { '01' => 'p', '02' => 'c', '04' => 'd', '06' => 'b', '10' => '-', '12' => 'l', '14' => 's' }.freeze
  FILE_PERMISSION = { '7' => 'rwx', '6' => 'rw-', '5' => 'r-x', '4' => 'r--', '3' => '-wx', '2' => '-w-', '1' => '--x', '0' => '---' }.freeze
  attr_reader :file_path, :stat

  def initialize(file_path)
    @file_path = file_path
    @stat = File::Stat.new(file_path)
  end

  def type_and_mode
    digits = stat.mode.to_s(8)
    type = format_file_category(digits)
    mode = format_mode(digits)
    "#{type}#{mode}"
  end

  private

  def format_mode(digits)
    suitable_digits = digits[-3..-1]
    suitable_digits.gsub(/./, FILE_PERMISSION)
  end

  def format_file_category(digits)
    suitable_digits = format('%06d', digits)
    FILE_FORMAT[suitable_digits.slice(/(^\d{2})/)]
  end

  public

  def nlink
    stat.nlink.to_s
  end

  def user
    Etc.getpwuid(stat.uid).name
  end

  def group
    Etc.getgrgid(stat.gid).name
  end

  def size
    stat.size.to_s
  end

  def mtime
    stat.mtime.strftime('%_m %e %H:%M')
  end

  def basename
    File.basename(file_path)
  end

  def blocks
    stat.blocks
  end
end
