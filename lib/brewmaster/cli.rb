module Brewmaster
  class CLI
    attr_accessor :configuration, :coordinator

    def initialize(args)
      options = {}

      @name = 'brewmaster'

      OptionParser.new do |parser|
        parser.banner = [
          "Usage: #{@name} [--bootstrap] [-c config_file]\n",
          "       #{@name} --help\n"
        ].compact.join

        parser.on('-c', '--config FILE') do |path|
          options[:config_path] = path
        end

        parser.on('--bootstrap') do
          options[:bootstrap] = true
        end

        # parser.on("-l", "--log FILE") do |path|
        #   options[:log_path] = path
        # end

        parser.on_tail("-?", "--help", "Display this usage information.") do
          puts "#{parser}\n"
          exit
        end
      end.parse!(args)

      self.configuration = Configuration.new(options)
      self.coordinator = Coordinator.new(configuration)
    end

    def run
      coordinator.run
    end
  end
end
