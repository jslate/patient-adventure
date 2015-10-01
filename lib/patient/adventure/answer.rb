module Patient
  module Adventure

    class Answer
      attr_reader :text, :scene_key

      def initialize(text, scene_key)
        @text = text
        @scene_key = scene_key
      end
    end

  end
end

