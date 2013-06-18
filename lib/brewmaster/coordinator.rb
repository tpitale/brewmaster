module Brewmaster
  class Coordinator
    attr_accessor :configuration

    def initialize(configuration)
      self.configuration = configuration
    end

    def run
      if configuration.boostrap?
        Brewmaster.bootstrap!
      else
        Brewmaster.setup_load_paths
      end

      run_brews
      run_casks
      run_rubies
    end

    def run_brews
      c = BrewCollection.new(configuration.brews)
      c.install_missing
      c.install_updates
    end

    def run_casks
      c = CaskCollection.new(configuration.casks)
      c.install_missing
    end

    def run_rubies
      c = RubyCollection.new(configuration.rubies)
      c.install_missing
    end
  end
end
