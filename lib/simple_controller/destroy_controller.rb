module SimpleController
  module DestroyController
    include SimpleController

    def destroy
      set_object
      notice = model_instance_variable.destroy ? I18n.t('successful_deletion') : I18n.t('unsuccessful_deletion')
      redirect_to(send redirect_path, {notice: notice})
    end
  end
end
