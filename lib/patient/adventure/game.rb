module Patient
  module Adventure

    class Game

      def initialize(&block)
        @scenes = {}
        instance_eval(&block)
        current_scene_key  = first_scene.enter
        until current_scene_key.nil?
          current_scene = get_scene(current_scene_key)
          current_scene_key = current_scene.enter
        end
      end

      def first_scene
        @scenes.values.detect{ |scene| scene.is_beginning? }
      end

      def scene(key, options = {}, &block)
        @scenes[key] = Scene.new(key, options, &block)
      end

      def get_scene(key)
        @scenes[key]
      end
    end

  end
end
