require 'test_helper'

class HostelLeavesControllerTest < ActionController::TestCase
  setup do
    @hostel_leafe = hostel_leaves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hostel_leaves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hostel_leafe" do
    assert_difference('HostelLeave.count') do
      post :create, hostel_leafe: {  }
    end

    assert_redirected_to hostel_leafe_path(assigns(:hostel_leafe))
  end

  test "should show hostel_leafe" do
    get :show, id: @hostel_leafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hostel_leafe
    assert_response :success
  end

  test "should update hostel_leafe" do
    put :update, id: @hostel_leafe, hostel_leafe: {  }
    assert_redirected_to hostel_leafe_path(assigns(:hostel_leafe))
  end

  test "should destroy hostel_leafe" do
    assert_difference('HostelLeave.count', -1) do
      delete :destroy, id: @hostel_leafe
    end

    assert_redirected_to hostel_leaves_path
  end
end
