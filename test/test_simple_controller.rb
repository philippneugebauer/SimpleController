require 'minitest/autorun'
require 'rake/testtask'
require 'active_support/inflector'
require 'active_support/concern'
require 'simple_controller'

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

class TestSimpleController < Minitest::Test

  def test_model_name
    assert_equal(Easy, EasyController.new.model_name)
  end

  def test_modulized_model_name
    assert_equal(Easy, Admin::EasyController.new.model_name)
  end
end
