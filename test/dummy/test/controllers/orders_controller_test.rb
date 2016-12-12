require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  setup do
    @order = Order.create!(name: 'one')
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { name: "OrderTest" }
    end

    assert_redirected_to "#{users_path}?notice=My+own+create+notice"
  end

  test "should update user" do
    patch :update, id: @order, order: { name: @order.name }
    assert_redirected_to "#{users_path}?notice=My+own+update+notice"
  end

  test "should destroy user" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to "#{users_path}?notice=My+own+delete+notice"
  end

end
