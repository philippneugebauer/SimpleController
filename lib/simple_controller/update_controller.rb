# encoding: UTF-8
module UpdateController
  include SimpleController
  before_action :set_object, only: [:edit, :update]

  def update
    if model_instance_variable.update(model_params)
      redirect_to action: 'index', notice: I18n.t('successful_update')
    else
      render 'edit'
    end
  end
end