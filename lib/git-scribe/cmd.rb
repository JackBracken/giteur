module GitScribe
  class Cmd
    def run(path, command)
      Dir.chdir(path) { %x[#{command}] }
    end

    def parse(command, result)
      cmd, params = command.scan(/git (.*) (.*)/).first.map(&:split).flatten
      send("parse_#{cmd.underscore}", result, params)
    end

    def run_and_parse(path, command)
      result = run(path, command)
      parse(command, result)
    end

    private

    def parse_shortlog(result, params)
      result.lines.map do |line|
        commits, name, email = line.scan(/(.*)\t(.*)<(.*)>/).first.map(&:strip)
        {commits: commits.to_i, name: name, email: email}
      end
    end
  end
end