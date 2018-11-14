require_relative 'spec_helper'

FUNCTION = 'slice'
ARITY = 3
PATH = File.join("lib",FUNCTION+".rb")
RELATIVE_PATH = File.join("..", PATH)
puts FUNCTION

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
        assert_equal "llo Wo", send(FUNCTION.to_sym, "Hello World", 2, 8)
    end
    
    it 'return `This is Sparta?` if input is `This is Sparta!`, `!` and `?`' do
        assert_equal "F", send(FUNCTION.to_sym, "Foobar", 0, 1)
    end

end