require_relative 'spec_helper'

FUNCTION = 'goodnight'
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

	it 'takes one argument' do
		message = "Funktionen #{FUNCTION} måste ta #{ARITY} argument"
		assert_equal ARITY, method(FUNCTION.to_sym).arity, message
	end

	it 'returns correct value if input is not David or Daniel' do
		assert_equal "Good night, Herman, Sweet Prince!", send(FUNCTION.to_sym, "Herman")
	end

	it 'returns correct value if input is David or Daniel' do
		assert_equal  "Lazy bastard!", send(FUNCTION.to_sym, "David")
	end

end