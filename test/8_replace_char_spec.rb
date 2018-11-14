require_relative 'spec_helper'

FUNCTION = 'replace_char'
ARITY = 3
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

    it 'return `ymgymgymg` if input is `omgomgomg`, `o` and `y`' do
        assert_equal "ymgymgymg", send(FUNCTION.to_sym, "omgomgomg", "o", "y")
    end
    
    it 'return `This is Sparta?` if input is `This is Sparta!`, `!` and `?`' do
        assert_equal "This is Sparta?", send(FUNCTION.to_sym, "This is Sparta!", "!", "?")
    end

end