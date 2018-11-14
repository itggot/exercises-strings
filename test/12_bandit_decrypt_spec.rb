require_relative 'spec_helper'

FUNCTION = 'bandit_decrypt'
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
    
    it 'return correct value for a single lower cased consonant' do
        assert_equal "l", send(FUNCTION.to_sym, "lol")
    end

    it 'return correct value for a single upper cased vowel' do
        assert_equal "a", send(FUNCTION.to_sym, "a")
    end

    it 'return correct value for a single upper cased consonant' do
        assert_equal "L", send(FUNCTION.to_sym, "LOL")
    end

    it 'return correct value for a single upper cased vowel' do
        assert_equal "Y", send(FUNCTION.to_sym, "Y")
    end

    it 'return correct value for a lower cased word' do
        assert_equal "hello", send(FUNCTION.to_sym, "hohelollolo")
    end

    it 'return correct value for a upper cased word' do
        assert_equal "HELLO", send(FUNCTION.to_sym, "HOHELOLLOLO")
    end

    it 'return correct value for a mixed cased word' do
        assert_equal "Hello", send(FUNCTION.to_sym, "HOHelollolo")
    end

    it 'returns correct value for a sentance' do
        assert_equal "Jag FLYGER från Umeå JUST NU", send(FUNCTION.to_sym,"JOJagog O FOFLOLYGOGEROR O fofrorånon O Umomeå O JOJUSOSTOT O NONU")
    end

end