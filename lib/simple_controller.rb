# encoding: UTF-8
module SimpleController
  module CreateController
    include SimpleController

    def new
      setup_instance_variable model_name.new
    end

    def create
      setup_instance_variable model_name.new(model_params)

      if model_instance_variable.save
          redirect_to({action: 'index'}, {notice: I18n.t('successful_creation')})
      else
        render 'new'
      end
    end
  end

  module DestroyController
    include SimpleController
    extend ActiveSupport::Concern

    included do
      before_action :set_object, only: :destroy
    end

    def destroy
      model_instance_variable.destroy
      redirect_to({action: 'index'}, {notice: I18n.t('successful_deletion')})
    end
  end

  module UpdateController
    include SimpleController
    extend ActiveSupport::Concern

    included do
      before_action :set_object, only: [:edit, :update]
    end

    def update
      if model_instance_variable.update(model_params)
        redirect_to({action: 'index'}, {notice: I18n.t('successful_update')})
      else
        render 'edit'
      end
    end
  end

  module IndexController
    include SimpleController

    def index
      setup_instance_variable(model_name.all, model_name.to_s.pluralize.underscore)
    end
  end

  module ShowController
    include SimpleController
    extend ActiveSupport::Concern

    included do
      before_action :set_object, only: :show
    end
  end


  def model_name_as_sym
    model_name.to_s.underscore
  end

  def model_name
    self.class.name.demodulize.sub("Controller", "").classify.constantize
  end

  def model_instance_variable
    instance_variable_get("@#{model_name_as_sym}")
  end

  def setup_instance_variable input, model_name = model_name_as_sym
    instance_variable_set("@#{model_name}", input)
  end

  def model_params
    params.require(model_name_as_sym.to_sym).permit(model_name.attribute_names.collect { |name| name.to_sym })
  end

  def set_object
    setup_instance_variable model_name.find(params[:id])
  end
end
