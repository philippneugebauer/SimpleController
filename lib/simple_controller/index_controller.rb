# encoding: UTF-8
module IndexController
  include SimpleController

  def index
    setup_instance_variable(model_name.all, model_name.to_s.pluralize.underscore)
  end
end