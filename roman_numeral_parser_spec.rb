describe RomanNumeralParser do
	before(:each) do
		@parser = RomanNumeralParser.new
	end


  it "deve iniciar com o map preenchido" do
    expect(@parser.numerals.length).to be 7
  end

  it "deve somar numero ao resultado" do
    expect(@parser.sum 1).to be 1
    expect(@parser.sum 3).to be 4
  end

  it "deve retornar um valor do map de algaritmos romanos" do
    expect(@parser.get_value "L").to be 50
  end

  it "deve parsear e somar ao resultado final um algaritmo romano" do
    expect(@parser.parsed_value "L").to be 50
    expect(@parser.parsed_value "I").to be 51
  end

  it "deve parsear e diminuir ao resultado final um algarismo romano" do
    expect(@parser.parsed_value "L").to be 50
    expect(@parser.parsed_negative_value "I").to be 49
    expect(@parser.parsed_value "X").to be 59
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
