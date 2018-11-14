require_relative 'spec_helper'

FUNCTION = 'reverse'
ARITY = 1
PATH = File.join("lib",FUNCTION+".rb")
RELATIVE_PATH = File.join("..", PATH)


describe "#{FUNCTION}" do
    
	def self.test_order
    	:alpha
    end
    
    it 'exists' do
        assert File.exist?(PATH), "Du behöver skapa filen #{PATH}"
        require_relative RELATIVE_PATH
    end

	it "has a function named #{FUNCTION}" do
		assert (method_exists? FUNCTION.to_sym), "Du behöver definera funktionen #{FUNCTION} i lib/#{FUNCTION}.rb"
    end

	it "takes #{ARITY.humanize} argument#{ARITY > 1 ? "s" : ""}" do
		message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
		assert_equal ARITY, method(FUNCTION.to_sym).arity, message
    end
    
    it 'return correct value if input is empty' do
        assert_equal "", send(FUNCTION.to_sym, "")
    end

    it 'return correct value' do
        assert_equal "olleH", send(FUNCTION.to_sym, "Hello")
    end

    it 'returns correct value for a sentance' do
        assert_equal "!nikpmup eht ma I !dlroW olleH", send(FUNCTION.to_sym, "Hello World! I am the pumpkin!")
    end

    it 'returns correct value for gibbersh' do
        gibberish = SecureRandom.hex
        assert_equal gibberish.reverse, send(FUNCTION.to_sym, gibberish)
    end


end