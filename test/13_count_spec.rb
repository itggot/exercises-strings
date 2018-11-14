require_relative 'spec_helper'

FUNCTION = 'count'
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

    it 'returns correct value' do
        assert_equal 3, send(FUNCTION.to_sym, "omgomgomg", "omg")
    end
    
    it 'returns correct value for non-alpha' do
        assert_equal 3, send(FUNCTION.to_sym, "This is some text!", " ")
    end
    
    it 'returns zero if not present' do
        assert_equal 0, send(FUNCTION.to_sym, "This is some text!", "??")
    end
end