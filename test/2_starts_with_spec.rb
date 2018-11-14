require_relative 'spec_helper'

FUNCTION = 'starts_with'
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

    it 'return correct value' do
        assert_equal true, send(FUNCTION.to_sym, "omgomgomg", "o")
    end
    
    it 'return correct value' do
        assert_equal false, send(FUNCTION.to_sym, "This is some text", "!")
    end

    it 'returns correct value for random gibberish' do
        100.times do 
            gibberish = SecureRandom.hex
            char = (("a".."z").to_a+("A".."Z").to_a).sample
            assert_equal gibberish.start_with?(char), send(FUNCTION.to_sym, gibberish, char)
        end
    end
end