### SimpleController

This gem provides you the standard logic of a rails controller which needn't to be implemented by every controller in the same way. Therefore, this gem gives you the chance to avoid a lot of redundant code which furthermore improves the maintainability of your code.

### Use it in your application

Installation is done by the following commands:

    $ gem install simple_controller
    $ bundle

Use it in your controllers:
```ruby 
class YourController
  include SimpleController::IndexController (index)
  include SimpleController::CreateController (new + create)
  include SimpleController::ShowController (show)
  include SimpleController::UpdateController (edit + update)
  include SimpleController::DestroyController (destroy)
```

### Provided methods

Actually, SimpleController provides all `CRUD` methods of Rails and it is only possible to deactivate them by overriding the methods in your controller implementation.
Next, if you don't want to have permitted all model attributes, you need to override the `model_params` method.
If you use a customized `id` for your model, you also need to override the `set_model` method.

### Required Adaption:

Add to your language files translations for the following symbols:

    successful_creation
    successful_update
    successful_deletion

### License

[MIT](LICENSE)
