#!/usr/bin/env ruby
# frozen_string_literal: true

require 'io/console'
require 'optparse'
require 'pathname'

require './lib/formatter'
require './lib/option'
require './lib/longformatfiles'
require './lib/longfile'
require './lib/shortformatfiles'

opt = ARGV.getopts('a', 'l', 'r')
path = ARGV[0] || '.'
pathname = Pathname(path)

files = Option.new(pathname)

files.a_option if opt['a']
files.r_option if opt['r']
if opt['l']
  files.l_option
else
  files.no_option
end
