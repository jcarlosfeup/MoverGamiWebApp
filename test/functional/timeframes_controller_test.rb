require 'test_helper'

class TimeframesControllerTest < ActionController::TestCase
  setup do
    @timeframe = timeframes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timeframes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timeframe" do
    assert_difference('Timeframe.count') do
      post :create, timeframe: { type: @timeframe.type, value: @timeframe.value }
    end

    assert_redirected_to timeframe_path(assigns(:timeframe))
  end

  test "should show timeframe" do
    get :show, id: @timeframe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timeframe
    assert_response :success
  end

  test "should update timeframe" do
    put :update, id: @timeframe, timeframe: { type: @timeframe.type, value: @timeframe.value }
    assert_redirected_to timeframe_path(assigns(:timeframe))
  end

  test "should destroy timeframe" do
    assert_difference('Timeframe.count', -1) do
      delete :destroy, id: @timeframe
    end

    assert_redirected_to timeframes_path
  end
end
