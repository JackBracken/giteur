module GitScribe
  class Runner
    attr_reader :path
    
    def initialize(options)
      @path = options[:path]
      validate_repo(@path)
      @repo = GitScribe::Git::Repo.new(options)
    end

    def test_command
      puts @repo.name
      puts @repo.version
    end

    private

    def validate_repo(path)
      raise ArgumentError("#{path} is not a valid git repository") unless
        Dir.exists?("#{path}/.git") || File.exists?("#{path}/.git") || File.exists?("#{path}/HEAD")
    end
  end
end