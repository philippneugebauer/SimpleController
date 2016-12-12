### SimpleController

[![Build Status](https://travis-ci.org/philippneugebauer/SimpleController.svg?branch=master)](https://travis-ci.org/philippneugebauer/SimpleController) [![Code Climate](https://codeclimate.com/github/philippneugebauer/SimpleController/badges/gpa.svg)](https://codeclimate.com/github/philippneugebauer/SimpleController) [![Test Coverage](https://codeclimate.com/github/philippneugebauer/SimpleController/badges/coverage.svg)](https://codeclimate.com/github/philippneugebauer/SimpleController) [![Dependency Status](https://gemnasium.com/philippneugebauer/SimpleController.svg)](https://gemnasium.com/philippneugebauer/SimpleController)

This gem provides you the standard logic of a rails controller which needn't to
be implemented by every controller in the same way. Therefore, this gem gives
you the chance to avoid a lot of redundant code which furthermore improves the
maintainability of your code. It requires Ruby >= 2.0.

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

The generated instance variable usable for your views will be `plural model name` at index site, otherwise the `singular model name`. Assuming a model called pen will named `@pens` at index site, otherwise `@pen`.

### Provided methods

Actually, SimpleController provides the `CRUD` methods of the included
controllers. If you don't want to have permitted all model attributes, you need
to override the `model_params` method. If you use a customized `id` for your
model, you also need to override the `set_object` method.

That means that you just need to add a method like this to your class:

```ruby
def model_params
    params.require(:user).permit(:name, :age)
end
```
or
```ruby
def set_object
    User.find(params[:email])
end
```

If you want to change the default `notices`, you need to override the
`destroy_notice`, `create_notice` or `update_notice`
methods returning your opted message as string. Per default, the name of the
`model` and a description of the action is displayed:

```ruby
def create_notice
  # e.g. User has been created
  "#{model_name} #{I18n.t('successful_creation')}"
end
```

Moreover, the redirect paths after a creation, update and delete can be
customized by overriding the `create_redirect`, `update_redirect` or
`delete_redirect` method. The all expect the wanted path as string output:

```ruby
def create_redirect
  # must be the path as string!
  'my_custom_path'
end
```

### Required Adaption:

Add to your language files translations for the following symbols which are
appended after the model's name:

    your_language:
      successful_creation: has been created
      successful_update: has been updated
      successful_deletion: has been deleted
      unsuccessful_deletion: could not deleted

### License

[MIT](MIT-LICENSE)

### Contribute

Changes should be provided by a pull request. Additionally, `rake` must
be executed outside the test folders to work correctly.
