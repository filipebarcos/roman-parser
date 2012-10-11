class RomanNumeralsParser
	attr_accessor :numeralsMap
	attr_accessor :result

	def initialize
		@numeralsMap = {"I"=>1, "V"=>5, "X"=>10, "L"=>50, "C"=>100, "D"=>500, "M"=>1000}
		@result = 0
	end

	def parse roman
		roman.length.times do |i|
			_char = roman[i]
			_nextChar = roman[i+1]
			unless _nextChar.nil?
				if getValue(_char) < getValue(_nextChar)
					parsedNegativeValue _char
					next
				end
			end
			parsedValue(_char)
		end

		return @result
	end

	def parsedNegativeValue roman
		return sum(-(getValue roman)) 
	end

	def parsedValue roman
		return sum(getValue roman)
	end

	def getValue key
		value = @numeralsMap[key]
		unless !value.nil? 
			raise "Not valid Roman Numerals"
		end
		return value
	end

	def sum num
		@result += num
	end

	def numeralsMap
		@numeralsMap
	end
end


describe RomanNumeralsParser do 
	before(:each) do
		@parser = RomanNumeralsParser.new
	end

	describe "#RomanNumeralsParser" do 
		it "deve iniciar com o map preenchido" do
			expect(@parser.numeralsMap.length).to be 7
		end

		it "deve somar numero ao resultado" do
			expect(@parser.sum 1).to be 1
			expect(@parser.sum 3).to be 4
		end

		it "deve retornar um valor do map de algaritmos romanos" do
			expect(@parser.getValue "L").to be 50
		end

		it "deve parsear e somar ao resultado final um algaritmo romano" do
			expect(@parser.parsedValue "L").to be 50
			expect(@parser.parsedValue "I").to be 51
		end

		it "deve parsear e diminuir ao resultado final um algarismo romano" do
			expect(@parser.parsedValue "L").to be 50
			expect(@parser.parsedNegativeValue "I").to be 49
			expect(@parser.parsedValue "X").to be 59
		end	

		it "deve parsear um unico algarismo romano em arabico" do
			expect(@parser.parse "I").to be 1 
		end

		it "deve parsear um algarismo romano simples em arabico" do
			expect(@parser.parse "III").to be 3 
		end

		it "deve parsear um algarismo romano com complexidade nivel 2 em arabico" do
			expect(@parser.parse "VIII").to be 8 
		end

		it "deve parsear um algarismo romano com complexidade nivel 3 em arabico" do
			expect(@parser.parse "IV").to be 4 
		end

		it "deve parsear um algarismo romano com complexidade nivel 4 em arabico" do
			expect(@parser.parse "LIX").to be 59 
		end

		it "deve parsear um algarismo romano com complexidade nivel 5 em arabico" do
			expect(@parser.parse "MCCXLIV").to be 1244 
		end

		it "deve parsear um algarismo romano com complexidade nivel huge mother fucker em arabico" do
			expect(@parser.parse "MMCCCXLII").to be 2342 
		end

		it "deve identificar que nao se trata de uma expressao de algarismo romano" do
			begin
				@parser.parse "YHJS"
			rescue RuntimeError => ex
				expect(ex.message).to eq("Not valid Roman Numerals")
			end			
		end

	end

end