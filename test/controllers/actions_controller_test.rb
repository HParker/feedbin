require 'test_helper'

class ActionsControllerTest < ActionController::TestCase
  setup do
    @action = actions(:one)
  end

  test "should get index" do
    login_as users(:ben)
    get :index
    assert_response :success
    assert_not_nil assigns(:actions)
  end

  test "should get new" do
    login_as users(:ben)
    get :new
    assert_response :success
  end

  test "should create action" do
    login_as users(:ben)

    feed = feeds(:daring_fireball)

    params = {
      title: "Star",
      query: "john",
      all_feeds: 0,
      feed_ids: [feed.id],
      actions: ["star"]
    }

    assert_difference('Action.count') do
      post :create, action_params: params
    end

    assert_redirected_to actions_path
  end

  test "should get edit" do
    login_as users(:ben)
    get :edit, id: @action
    assert_response :success
  end

  test "should update action" do
    new_title = "New"

    login_as users(:ben)

    patch :update, id: @action, action_params: {title: new_title}
    assert_redirected_to actions_path

    @action.reload
    assert_equal new_title, @action.title
  end

  test "should destroy action" do
    login_as users(:ben)
    assert_difference('Action.count', -1) do
      delete :destroy, id: @action
    end

    assert_redirected_to actions_path
  end

end