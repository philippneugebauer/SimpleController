# encoding: UTF-8
module DestroyController
  include SimpleController
  before_action :set_object, only: [:destroy]

  def destroy
    model_instance_variable.destroy
    redirect_to action: 'index', notice: I18n.t('successful_deletion')
  end
end