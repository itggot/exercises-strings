require_relative 'spec_helper'

FUNCTION = 'index_of_char'
ARITY = 2
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

    it 'return 2 if input is `Hello` and `l`' do
        assert_equal 2, send(FUNCTION.to_sym, "Hello", "l")
    end
    
    it 'return nil if input is `Hello` and `x`' do
        assert_nil send(FUNCTION.to_sym, "Hello", "x")
    end

    it 'returns correct value for random gibberish' do
        100.times do 
            gibberish = SecureRandom.hex
            char = (("a".."z").to_a+("A".."Z").to_a).sample
            assert_equal gibberish.index(char) , send(FUNCTION.to_sym, gibberish, char)
        end
    end
end