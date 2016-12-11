module SimpleController
  module DestroyController
    include SimpleController

    def destroy
      set_object
      model_instance_variable.destroy
      redirect_to(send redirect_path, {notice: notice_message})
    end

    def notice_message
      "#{model_name} #{model_instance_variable.destroyed? ? I18n.t('successful_deletion') : I18n.t('unsuccessful_deletion')}"
    end
  end
end
