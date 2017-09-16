module Aruba::Turnip
  module Text
    def unescape_control_codes(text)
      text.gsub(/\\c([a-z])/) { |m| (m[2].ord - "a".ord + 1).chr }
    end
  end
end
