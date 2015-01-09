# encoding: UTF-8
module SimpleController
  class ShowController
    before_action :set_object, only: [:show]
  end
end