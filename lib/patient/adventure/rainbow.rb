module Patient
  module Adventure

    module Rainbow
      COLORS = { red: 31, green: 32, black: 0 }
      COLORS.each do |key, value|
        define_singleton_method(key) do |string|
          "\e\[#{value}m#{string}\e\[#{COLORS[:black]}m"
        end
      end
    end

  end
end
