module Brewmaster
  class RubyCollection
    def initialize(rubies)
      @rubies = rubies
    end

    def install_missing
      missing.each {|v| install_version(v)}
    end

    def missing
      (@rubies - self.class.installed).select {|v| available?(v)}
    end

    def available?(version)
      self.class.available_versions.include?(version)
    end

    def install_version(v)
      `ruby-build #{v} ~/.rubies/#{v}`
    end

    def self.installed
      `ls ~/.rubies/`.split
    end

    def self.available_versions
      `ruby-build --definitions`.split
    end
  end
end
