require 'minitest'
require 'minitest/reporters'
MiniTest.autorun
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
