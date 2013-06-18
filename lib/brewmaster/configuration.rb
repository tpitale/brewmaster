module Brewmaster
  class Configuration
    def initialize(options={})
      @bootstrap = options.fetch(:bootstrap, false)
      @config_file = YAML.load_file(options.fetch(:config_path, Brewmaster::BOOTSTRAP_CONFIG_PATH))
    end

    def bootstrap?
      @bootstrap
    end

    def brews
      @brews ||= @config_file['brews']
    end

    def casks
      @casks ||= @config_file['casks']
    end

    def rubies
      @rubies ||= @config_file['rubies']
    end
  end
end
