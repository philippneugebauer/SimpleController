# encoding: UTF-8
module ShowController
  include SimpleController
  before_action :set_object, only: [:show]
end