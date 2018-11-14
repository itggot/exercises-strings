require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/fail_fast'
require 'mocha/minitest'
require 'humanize'
require 'securerandom'
MiniTest::Reporters.use!(MiniTest::Reporters::SpecReporter.new)
$VERBOSE = nil