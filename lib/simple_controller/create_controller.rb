module SimpleController
  module CreateController
    include SimpleController

    def new
      setup_instance_variable model_name.new
    end

    def create
      setup_instance_variable model_name.new(model_params)

      if model_instance_variable.save
        redirect_to(send create_redirect, {notice: create_notice})
      else
        render 'new'
      end
    end

    def create_redirect
      redirect_path
    end

    def create_notice
      "#{model_name} #{I18n.t('successful_creation')}"
    end
  end
end
