require 'git-scribe'
require 'thor'

module GitScribe
  class CLI < Thor
    option :path, :aliases => :p, :default => '.', :desc => 'Repository path.'

    desc 'generate', 'Generates statistics for the repository'
    def generate
      puts GitScribe::VERSION
      GitScribe::Runner.new(options).test_command
    end
  end
end
