# encoding: UTF-8
require 'action_controller'
module SimpleController
  class CreateController < ActionController::Base

    def index
      setup_instance_variable(model_name.all, model_name.to_s.pluralize.underscore)
    end

    def new
      setup_instance_variable model_name.new
    end

    def create
      setup_instance_variable model_name.new(model_params)

      if model_instance_variable.save
        redirect_to action: 'index', notice: I18n.t('successful_creation')
      else
        render 'new'
      end
    end

  end
end