# frozen_string_literal: true

require 'pathname'
require 'etc'

MAXIMUM_NUMBER_OF_COLUMNS = 5
class ShortFormatter

  def initialize(file_paths)
    @files = ShortFormatFiles.new(file_paths).build_name_array
    @rows_files = rows_order(@files)
  end

  def format
    @rows_files.map do |set_files|
      set_files.each { |file| print file }
      print "\n"
    end
  end

  private

  def rows_order(array)
    array << nil until ShortFormatFiles.multiples_of_number?(array, MAXIMUM_NUMBER_OF_COLUMNS)
    slice_files = array.each_slice(array.size / MAXIMUM_NUMBER_OF_COLUMNS).to_a
    slice_files.transpose
  end
end
