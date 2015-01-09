# encoding: UTF-8
require 'action_controller'
module SimpleController
  class DestroyController < ActionController::Base
    before_action :set_object, only: [:destroy]

    def destroy
      model_instance_variable.destroy
      redirect_to action: 'index', notice: I18n.t('successful_deletion')
    end
  end
end