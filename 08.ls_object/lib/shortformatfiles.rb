# frozen_string_literal: true

require 'pathname'

class ShortFormatFiles
  attr_reader :file_paths

  def initialize(file_paths)
    @file_paths = file_paths
    @files = build_name_array
  end

  def self.multiples_of_three?(files)
    (files.size % 3).zero?
  end

  def build_name_array
    file_paths.map do |file_path|
      File.basename(file_path).ljust(13).to_s
    end
  end
end
