require 'test_helper'

class EasyController
  extend ActiveSupport::Inflector
  include SimpleController
end

class Admin
  class EasyController
    extend ActiveSupport::Inflector
    include SimpleController
  end
end

class Easy
end

class SimpleControllerUnitTest < Minitest::Test

  def test_model_name
    assert_equal(Easy, EasyController.new.model_name)
  end

  def test_modulized_model_name
    assert_equal(Easy, Admin::EasyController.new.model_name)
  end

  def test_model_name_as_sym
    assert_equal("easy", EasyController.new.model_name_as_sym)
  end

  def test_instance_variable
    e = EasyController.new
    assert_nil(e.model_instance_variable)
    e.setup_instance_variable("HELLO")
    assert_equal("HELLO", e.model_instance_variable.to_s)
    assert(String, e.model_instance_variable.class)
  end
end
