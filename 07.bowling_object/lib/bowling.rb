# !/usr/bin/env ruby
# frozen_string_literal: true

require './lib/shot'
require './lib/frame'
require './lib/game'

puts Game.new(ARGV[0]).print_score
