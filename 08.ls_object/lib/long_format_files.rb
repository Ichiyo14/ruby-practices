# frozen_string_literal: true

require 'etc'
require 'pathname'

class LongFormatFiles
  attr_reader :file_paths, :long_format_files

  def initialize(file_paths)
    @file_paths = file_paths
    @long_format_files = build_datas
  end

  def build_datas
    file_paths.map do |file_path|
      LongFile.new(file_path)
    end
  end

  def nlink_max_size
    long_format_files.map { |file| file.nlink.size }.max
  end

  def user_max_size
    long_format_files.map { |file| file.user.size }.max
  end

  def size_max_size
    long_format_files.map { |file| file.size.size }.max
  end

  def mtime_max_size
    long_format_files.map { |file| file.mtime.size }.max
  end

  def basename_max_size
    long_format_files.map { |file| file.basename.size }.max
  end

  def blocks_max_size
    long_format_files.map { |file| file.blocks.size }.max
  end

  def blocks_sum
    long_format_files.sum(&:blocks)
  end
end
