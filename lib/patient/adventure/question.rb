module Patient
  module Adventure

    class Question
      def initialize(text, &block)
        @text = text
        @answers = []
        instance_eval(&block)
      end

      def answer(text, scene_key)
        @answers << Answer.new(text, scene_key)
      end

      def ask
        puts "#{@text}\n"
        @answers.each.with_index do |answer, i|
          puts "#{i + 1}. #{answer.text}"
        end
        get_anwer
      end

      def get_anwer
        puts
        print Rainbow.red("Enter your answer: ")
        answer_number = gets.chomp.to_i
        @answers[answer_number - 1].scene_key
      end
    end

  end
end
