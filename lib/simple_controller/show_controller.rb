module SimpleController
  module ShowController
    include SimpleController

    def show
      set_object
    end
  end
end
