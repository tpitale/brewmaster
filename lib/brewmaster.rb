require 'optparse'
require 'yaml'

HOMEBREW_ROOT = `brew --prefix`.strip

$: << [HOMEBREW_ROOT, 'Library', 'Homebrew'].join('/')

require 'global'
require 'formula'
require 'keg'

module Brewmaster
  BOOTSTRAP_CONFIG_PATH = File.expand_path('~/.bootstrap.yml')
end

require "brewmaster/version"
require 'brewmaster/brew_collection'
require 'brewmaster/ruby_collection'
require 'brewmaster/configuration'
require 'brewmaster/coordinator'
require 'brewmaster/cli'
