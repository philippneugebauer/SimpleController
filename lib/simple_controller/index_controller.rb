# encoding: UTF-8
require 'action_controller'
module SimpleController
  class IndexController

    def index
      setup_instance_variable(model_name.all, model_name.to_s.pluralize.underscore)
    end
  end
end