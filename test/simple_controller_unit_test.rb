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

  def test_has_modul_name
    assert(Admin::EasyController.new.has_modul_name?)
  end

  def test_has_no_modul_name
    assert_equal(false, EasyController.new.has_modul_name?)
  end

  def test_modul_name
    assert_equal("", EasyController.new.modul_name)
  end

  def test_modulized_modul_name
    assert_equal("admin", Admin::EasyController.new.modul_name)
  end

  def test_modul_name_with_underscore
    assert_equal("", EasyController.new.modul_name_with_underscore)
  end

  def test_modulized_modul_name_with_underscore
    assert_equal("admin_", Admin::EasyController.new.modul_name_with_underscore)
  end

  def test_redirect_path
    assert_equal("easies_path", EasyController.new.redirect_path)
  end

  def test_modulized_redirect_path
    assert_equal("admin_easies_path", Admin::EasyController.new.redirect_path)
  end
end
