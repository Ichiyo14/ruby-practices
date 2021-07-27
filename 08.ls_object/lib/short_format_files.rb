# frozen_string_literal: true

require 'pathname'

class ShortFormatFiles

  def initialize(file_paths)
    @file_paths = file_paths
    @files = build_name_array
  end

  def self.multiples_of_number?(files, number_of_collumns)
    (files.size % number_of_collumns).zero?
  end

  def build_name_array
    @file_paths.map do |file_path|
      File.basename(file_path).ljust(13)
    end
  end
end
