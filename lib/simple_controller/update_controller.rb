module SimpleController
  module UpdateController
    include SimpleController
    extend ActiveSupport::Concern

    included do
      before_action :set_object, only: [:edit, :update]
    end

    def update
      if model_instance_variable.update(model_params)
        redirect_to(send update_redirect, {notice: update_notice})
      else
        render 'edit'
      end
    end

    def update_redirect
      redirect_path
    end

    def update_notice
      "#{model_name} #{I18n.t('successful_update')}"
    end
  end
end
