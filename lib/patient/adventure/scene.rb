module Patient
  module Adventure

    class Scene
      attr_reader :text

      def initialize(key, options, &block)
        @text = File.read("scenes/#{key}.txt")
        @options = options
        instance_eval(&block) unless block.nil?
      end

      def question(text, &block)
        @question = Question.new(text, &block)
      end

      def is_beginning?
        @options[:beginning]
      end

      def is_ending?
        @options[:ending]
      end

      def enter
        puts reformat_wrapped("\n#{Rainbow.green(text)}\n")
        @question.ask unless is_ending?
      end
    end

    private

      def reformat_wrapped(string, width=78)
          lines = []
          line = "| "
          string.split(/\s+/).each do |word|
            if line.size + word.size >= width
              lines << line
              line = "| " + word
            elsif line.empty?
             line = word
            else
             line << " " << word
           end
           end
           lines << "%-#{width}.#{width}s" % line if line
          return ('_' * width) + "\n" + lines.join(" |\n") + "\n" + ('_' * width)
        end





  end
end
