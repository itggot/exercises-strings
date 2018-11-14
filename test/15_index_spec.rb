require_relative 'spec_helper'

FUNCTION = 'index'
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
        send(FUNCTION.to_sym, "Hello", "ell").must_equal 1
    end

    it 'return 0 if the strings are equal' do
        send(FUNCTION.to_sym, "Hello", "Hello").must_equal 0
    end

    it 'return 0 if it starts with the substring' do
        send(FUNCTION.to_sym, "Hello", "He").must_equal 0
    end
    
    it 'return correct value' do
        send(FUNCTION.to_sym, "Hello", "llo").must_equal 2
    end
    
    it 'return nil if input is not present' do
        assert_nil send(FUNCTION.to_sym, "Hello", "elx")
    end

 
end