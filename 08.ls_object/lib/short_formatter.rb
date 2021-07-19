# frozen_string_literal: true

require 'pathname'
require 'etc'

class ShortFormatter
  attr_reader :files, :three_rows_files

  def initialize(file_paths)
    @files = ShortFormatFiles.new(file_paths).build_name_array
    @three_rows_files = three_rows_order(files)
  end

  def format
    three_rows_files.map do |three_set_files|
      three_set_files.each { |file| print file }
      print "\n"
    end
  end

  private

  def three_rows_order(array)
    array << '' until ShortFormatFiles.multiples_of_three?(array)
    slice_files = array.each_slice(array.size / 3).to_a
    slice_files.transpose
  end
end
