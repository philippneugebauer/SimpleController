require 'action_controller'
require 'minitest/autorun'
require 'simple_controller'

class EasyController < SimpleController
end

class SimpleControllerTest < Minitest::Test

  #def test_model_name
    #assert_equal('Easy', EasyController.new.model_name)
  #end

  #def test_modulized_model_name
    #assert_equal('Easy', Admin::EasyController.new.model_name)
  #end
end
