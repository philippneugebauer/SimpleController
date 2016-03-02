module SimpleController
  module UpdateController
    include SimpleController
    extend ActiveSupport::Concern

    included do
      before_action :set_object, only: [:edit, :update]
    end

    def update
      if model_instance_variable.update(model_params)
        redirect_to(send redirect_path, {notice: I18n.t('successful_update')})
      else
        render 'edit'
      end
    end
  end
end
