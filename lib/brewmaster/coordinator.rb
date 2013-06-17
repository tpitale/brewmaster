module Brewmaster
  class Coordinator
    attr_accessor :configuration

    def initialize(configuration)
      self.configuration = configuration
    end

    def run
      run_brews
      run_rubies
    end

    def run_brews
      c = BrewCollection.new(configuration.brews)
      c.install_missing
      c.install_updates
    end

    def run_rubies
      c = RubyCollection.new(configuration.rubies)
      c.install_missing
    end

    def update_homebrew
      `brew update`
    end
  end
end
