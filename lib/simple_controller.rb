# encoding: UTF-8

require_relative 'simple_controller/create_controller'
require_relative 'simple_controller/update_controller'
require_relative 'simple_controller/index_controller'
require_relative 'simple_controller/destroy_controller'
require_relative 'simple_controller/show_controller'

module SimpleController

  def redirect_path
    model_path = "#{model_name_as_sym.pluralize}_path"
    has_modul_name? ? "#{modul_name_with_underscore}#{model_path}" : model_path
  end

  def model_name_as_sym
    model_name.to_s.underscore
  end

  def model_name
    self.class.name.demodulize.sub("Controller", "").classify.constantize
  end

  def modul_name
    self.class.name.deconstantize.to_s.underscore
  end

  def modul_name_with_underscore
    has_modul_name? ? "#{modul_name}_" : ""
  end

  def has_modul_name?
    modul_name.present?
  end

  def model_instance_variable
    instance_variable_get("@#{model_name_as_sym}")
  end

  def setup_instance_variable input, model_name = model_name_as_sym
    instance_variable_set("@#{model_name}", input)
  end

  def model_params
    params.require(model_name_as_sym.to_sym).permit(model_name.attribute_names.collect { |name| name.to_sym unless name.eql? 'id' })
  end

  def set_object
    setup_instance_variable model_name.find(params[:id])
  end
end
