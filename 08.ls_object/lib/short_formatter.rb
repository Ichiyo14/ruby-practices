# frozen_string_literal: true

require 'pathname'
require 'etc'

MAXIMUM_NUMBER_OF_COLUMNS = 5
class ShortFormatter
  def initialize(file_paths)
    short_format_files = ShortFormatFiles.new(file_paths)
    @rows_files = transpose(short_format_files.basenames)
  end

  def output
    @rows_files.each do |basenames|
      basenames.each { |basename| print basename }
      print "\n"
    end
  end

  private

  def transpose(basenames)
    basenames << nil until ShortFormatFiles.multiples_of_number?(basenames, MAXIMUM_NUMBER_OF_COLUMNS)
    slice_files = basenames.each_slice(basenames.size / MAXIMUM_NUMBER_OF_COLUMNS).to_a
    slice_files.transpose
  end
end
