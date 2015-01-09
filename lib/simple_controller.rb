# encoding: UTF-8
module SimpleController
  def model_name_as_sym
    model_name.to_s.underscore
  end

  def model_name
    self.class.name.demodulize.sub("Controller", "").classify.constantize
  end

  def model_instance_variable
    instance_variable_get("@#{model_name_as_sym}")
  end

  def setup_instance_variable input, model_name = model_name_as_sym
    instance_variable_set("@#{model_name}", input)
  end

  def model_params
    params.require(model_name_as_sym.to_sym).permit(model_name.attribute_names.collect {|name| name.to_sym})
  end

  def set_object
    setup_instance_variable model_name.find(params[:id])
  end
end