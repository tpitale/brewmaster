require 'cmd/install'
require 'cmd/outdated'
require 'cmd/upgrade'

module Brewmaster
  class BrewCollection
    def initialize(names)
      @names = names
      @formulae = names.map {|name| Formula.factory(name)}
    end

    def install_missing
      Homebrew.perform_preinstall_checks

      missing.each {|f| Homebrew.install_formula(f)}
    end

    def install_updates
      Homebrew.perform_preinstall_checks

      outdated.each {|f| Homebrew.upgrade_formula(f)}
    end

    # def remove_extras
    #   p extras
    # end

    # anything not installed, excluding the outdated
    def missing
      @missing ||= @formulae.select {|f| !f.installed?} - self.class.outdated
    end

    # anything outdated that we want installed that is not pinned
    def outdated
      @outdated ||= @formulae & self.class.outdated.select {|f| !f.pinned?}
    end

    # anything installed, that's not in our list anymore
    # def extras
    #   @extras ||= self.class.installed - @formulae
    # end

    def self.installed
      # `ls #{HOMEBREW_CELLAR}`.split
      Formula.installed
    end

    def self.outdated
      Homebrew.outdated_brews
    end
  end
end
