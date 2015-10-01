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
        puts "\n#{Rainbow.green(text)}\n"
        @question.ask unless is_ending?
      end
    end

  end
end
