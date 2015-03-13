class UsersController < ApplicationController
  include SimpleController::IndexController
  include SimpleController::UpdateController
  include SimpleController::CreateController
  include SimpleController::ShowController
  include SimpleController::DestroyController
end
