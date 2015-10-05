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
          redirect_to(send redirect_path, {notice: I18n.t('successful_creation')})
      else
        render 'new'
      end
    end
  end

  module DestroyController
    include SimpleController

    def destroy
      set_object

      check_execution destroy_checks if respond_to? destroy_checks

      notice = model_instance_variable.destroy ? I18n.t('successful_deletion') : I18n.t('unsuccessful_deletion')
      redirect_to(send redirect_path, {notice: notice})
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
        redirect_to(send redirect_path, {notice: I18n.t('successful_update')})
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

    def show
      set_object
    end
  end

  def destroy_checks
    []
  end

  def check_execution options
    options.each { |o| send o }
  end

  def redirect_path
    model_path = "#{model_name_as_sym.pluralize}_path"
    has_modul_name? ? "#{modul_name_with_underscore}#{model_path}" : model_path
  end

  def model_name_as_sym
    model_name.to_s.underscore
  end

  def model_name
    self.class.name.demodulize.sub("Controller", "").classify.constantize
  end

  def modul_name
    self.class.name.deconstantize.to_s.underscore
  end

  def modul_name_with_underscore
    has_modul_name? ? "#{modul_name}_" : ""
  end

  def has_modul_name?
    modul_name.present?
  end

  def model_instance_variable
    instance_variable_get("@#{model_name_as_sym}")
  end

  def setup_instance_variable input, model_name = model_name_as_sym
    instance_variable_set("@#{model_name}", input)
  end

  def model_params
    params.require(model_name_as_sym.to_sym).permit(model_name.attribute_names.collect { |name| name.to_sym unless name.eql? 'id' })
  end

  def set_object
    setup_instance_variable model_name.find(params[:id])
  end
end
