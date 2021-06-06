module GitScribe
  module Git
    class Repo
      attr_accessor :path, :name, :version

      def initialize(params)
        puts "DEBUG - #{params.inspect}"
        @path = File.expand_path(params[:path])
        @tree_path ||= '.'
      end

      def path
        @path ||= '.'
      end

      def tree_path
        @tree_path ||= '.'
      end

      def name
        @name ||= (File.expand_path(File.join(path, tree_path)).sub(File.dirname(File.expand_path(path))+File::SEPARATOR,"") || File.basename(path))
      end

      def version
        @version ||= cmd.run(@path, 'git rev-parse HEAD')
      end

      def cmd
        @cmd ||= Cmd.new
      end
    end
  end
end