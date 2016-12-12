class OrdersController < ApplicationController
  include SimpleController::CreateController
  include SimpleController::UpdateController
  include SimpleController::DestroyController

  def create_redirect
    'users_path'
  end

  def create_notice
    'My own create notice'
  end

  def update_redirect
    'users_path'
  end

  def update_notice
    'My own update notice'
  end

  def destroy_redirect
    'users_path'
  end

  def destroy_notice
    'My own delete notice'
  end

end
