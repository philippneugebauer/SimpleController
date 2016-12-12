module SimpleController
  module DestroyController
    include SimpleController

    def destroy
      set_object
      model_instance_variable.destroy
      redirect_to(send destroy_redirect, {notice: destroy_notice})
    end

    def destroy_redirect
      redirect_path
    end

    def destroy_notice
      "#{model_name} #{model_instance_variable.destroyed? ? I18n.t('successful_deletion') : I18n.t('unsuccessful_deletion')}"
    end
  end
end
