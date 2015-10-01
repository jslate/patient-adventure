require 'pry'

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
        puts Rainbow.green(reformat_wrapped(text))
        @question.ask unless is_ending?
      end

    private
      def reformat_wrapped(string, width=78)
        lines = []
        line = ""
        string.split(/\s+/).each do |word|
          if line.size + word.size >= width - 4
            lines << format_line(line, width)
            line = word
          elsif line.empty?
           line = word
          else
           line << " " << word
         end
         end
         lines << format_line(line, width) if line
        return "\n" + ('_' * (width+2)) + "\n" + lines.join("\n") + "\n" + ('_' * (width+2)) + "\n"
      end

      def format_line(string, width)
        "| " + "%-#{width}.#{width}s" % string + "|"
      end
    end


  end
end
