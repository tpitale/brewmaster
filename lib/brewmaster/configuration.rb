module Brewmaster
  class Configuration
    def initialize(options={})
      @config_file = YAML.load_file(options.fetch(:config_path, Brewmaster::BOOTSTRAP_CONFIG_PATH))
    end

    def brews
      @brews ||= @config_file['brews']
    end

    def casks
      @brews ||= @config_file['brews']
    end

    def rubies
      @rubies ||= @config_file['rubies']
    end
  end
end
