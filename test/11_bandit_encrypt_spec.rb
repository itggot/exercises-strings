require_relative 'spec_helper'

BONUS_ENABLED = false

FUNCTION = 'bandit_encrypt'
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
        assert_equal "lol", send(FUNCTION.to_sym, "l")
    end

    it 'return correct value for a single upper cased vowel' do
        assert_equal "a", send(FUNCTION.to_sym, "a")
    end

    it 'return correct value for a single upper cased consonant' do
        if BONUS_ENABLED
            assert_equal "LOL", send(FUNCTION.to_sym, "L")
        else
            assert_equal "LoL", send(FUNCTION.to_sym, "L")
        end
    end

    it 'return correct value for a single upper cased vowel' do
        assert_equal "Y", send(FUNCTION.to_sym, "Y")
    end

    it 'return correct value for a lower cased word' do
        assert_equal "hohelollolo", send(FUNCTION.to_sym, "hello")
    end

    it 'return correct value for a upper cased word' do
        if BONUS_ENABLED
            assert_equal "HOHELOLLOLO", send(FUNCTION.to_sym, "HELLO")
        else
            assert_equal "HoHELoLLoLO", send(FUNCTION.to_sym, "HELLO")
        end
    end

    it 'return correct value for a mixed cased word' do
        if BONUS_ENABLED
            assert_equal "HOHelollolo", send(FUNCTION.to_sym, "Hello")
        else
            assert_equal "HoHelollolo", send(FUNCTION.to_sym, "Hello")
        end
    end

    it 'returns correct value for a sentance' do
        if BONUS_ENABLED
            assert_equal "JOJagog O FOFLOLYGOGEROR O fofrorånon O Umomeå O JOJUSOSTOT O NONU", send(FUNCTION.to_sym,"Jag FLYGER från Umeå JUST NU")
        else
            assert_equal "JoJagog o foflolygogeror o fofrorånon o Umomeå o jojusostot o nonu", send(FUNCTION.to_sym,"Jag flyger från Umeå just nu")
        end
    end

end