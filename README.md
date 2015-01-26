### SimpleController

[![Build Status](https://travis-ci.org/philippneugebauer/SimpleController.svg?branch=master)](https://travis-ci.org/philippneugebauer/SimpleController) [![Code Climate](https://codeclimate.com/github/philippneugebauer/SimpleController/badges/gpa.svg)](https://codeclimate.com/github/philippneugebauer/SimpleController) [![Test Coverage](https://codeclimate.com/github/philippneugebauer/SimpleController/badges/coverage.svg)](https://codeclimate.com/github/philippneugebauer/SimpleController)

This gem provides you the standard logic of a rails controller which needn't to be implemented by every controller in the same way. Therefore, this gem gives you the chance to avoid a lot of redundant code which furthermore improves the maintainability of your code.

### Use it in your application

Installation is done by the following commands:

    $ gem install simple_controller
    $ bundle

Use it in your controllers:
```ruby 
class YourController < ActionController::Base (or another parent class extending this class)
  include SimpleController::IndexController (index)
  include SimpleController::CreateController (new + create)
  include SimpleController::ShowController (show)
  include SimpleController::UpdateController (edit + update)
  include SimpleController::DestroyController (destroy)
```

The generated instance variable using in your view will be `plural model name` for the index site, otherwise the `singular model name`. Assuming a model called pen will named `@pens` for the index site, otherwise `@pen`.

### Provided methods

Actually, SimpleController provides all `CRUD` methods of Rails and it is only possible to deactivate them by overriding the methods in your controller implementation.
Next, if you don't want to have permitted all model attributes, you need to override the `model_params` method.
If you use a customized `id` for your model, you also need to override the `set_model` method.

### Required Adaption:

Add to your language files translations for the following symbols:
    
    your_language:
      successful_creation
      successful_update
      successful_deletion

### License

[MIT](LICENSE)
