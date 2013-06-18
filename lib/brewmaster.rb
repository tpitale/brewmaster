require 'optparse'
require 'yaml'

module Brewmaster
  BOOTSTRAP_CONFIG_PATH = File.expand_path('~/.bootstrap.yml')

  def self.bootstrap!
    install_homebrew
    install_brew_cask
    setup_load_paths
    install_ruby_tools
  end

  def self.install_homebrew
    `ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"`
  end

  def self.update_homebrew
    `brew update`
  end

  def self.install_brew_cask
    `brew tap phinze/homebrew-cask`
    `brew install brew-cask`
  end

  def self.install_ruby_tools
    BrewCollection.new(['chruby', 'ruby-build']).install_missing
  end

  def self.setup_load_paths
    setup_homebrew_load_path
    setup_brew_cask_load_path
  end

  def self.setup_homebrew_load_path
    begin
      # build homebrew into loadpath
      $: << File.join(`brew --prefix`.strip, 'Library', 'Homebrew')

      require 'global'
      require 'formula'
      require 'keg'
      require 'cmd/install'
      require 'cmd/outdated'
      require 'cmd/upgrade'
    rescue
      puts 'You seem to be missing homebrew'
    end
  end

  def self.setup_brew_cask_load_path
    begin
      # build brew-cask into loadpath
      cask_bin = `which brew-cask.rb`.strip
      cask_bin_path = `dirname #{cask_bin}`.strip
      cask_bin_link = `readlink #{cask_bin}`.strip
      cask_real_path = Pathname.new(File.join(cask_bin_path,cask_bin_link)).realpath

      $: << File.expand_path('../../rubylib', cask_real_path)

      require 'cask'
    rescue => e
      puts 'You seem to be missing brew-cask'
    end
  end
end

require "brewmaster/version"
require 'brewmaster/brew_collection'
require 'brewmaster/cask_collection'
require 'brewmaster/ruby_collection'
require 'brewmaster/configuration'
require 'brewmaster/coordinator'
require 'brewmaster/cli'
