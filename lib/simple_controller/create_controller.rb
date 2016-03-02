module SimpleController
  module CreateController
    include SimpleController

    def new
      setup_instance_variable model_name.new
    end

    def create
      setup_instance_variable model_name.new(model_params)

      if model_instance_variable.save
        redirect_to(send redirect_path, {notice: I18n.t('successful_creation')})
      else
        render 'new'
      end
    end
  end
end
