# frozen_string_literal: true

require 'pathname'

class ShortFormatFiles
  attr_reader :basenames

  def initialize(file_paths)
    @file_paths = file_paths
    @basenames = basenames
  end

  def self.multiples_of_number?(files, number_of_collumns)
    (files.size % number_of_collumns).zero?
  end

  def basenames
    @file_paths.map do |file_path|
      File.basename(file_path).ljust(13)
    end
  end
end
