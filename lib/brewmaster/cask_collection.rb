module Brewmaster
  class CaskCollection
    def initialize(names)
      @names = names
    end

    def install_missing
      Cask::CLI::Install.run(*missing)
    end

    # anything not installed, excluding the outdated
    def missing
      @missing ||= @names - self.class.installed
    end

    def self.installed
      Cask.installed.map {|c| (c.split("/").last)}
    end
  end
end
