class RomanNumeralParser
	attr_reader :numerals
	attr_accessor :result

	def initialize
		@numerals = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
		@result = 0
	end

	def parse roman
		roman.length.times do |i|
			char = roman[i]
			next_char = roman[i+1]
			unless next_char.nil?
				if get_value(char) < get_value(next_char)
					parsed_negative_value(char)
					next
				end
			end
			parsed_value(char)
		end

		@result
	end

	def parsed_negative_value roman
		sum(-(get_value roman))
	end

	def parsed_value roman
		sum(get_value roman)
	end

	def get_value key
		value = @numerals[key]
		unless !value.nil?
			raise "Not valid Roman Numerals"
		end
		value
	end

	def sum num
		@result += num
	end
end
