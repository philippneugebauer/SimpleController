# encoding: UTF-8
require 'action_controller'
module SimpleController
  class ShowController < ActionController::Base
    before_action :set_object, only: [:show]
  end
end