require 'test_helper'

class HmmsControllerTest < ActionController::TestCase
  test "should get index"do
    get :index
    assert_response :success
  end
  
  test "should get leave_apply" do
    get :leave_apply
    assert_response :success
  end

  test "should get leave_approve_warden" do
    get :leave_approve_warden
    assert_response :success
  end

  test "should get leave_approve_academic" do
    get :leave_approve_academic
    assert_response :success
  end

  test "should get mess_bill" do
    get :mess_bill
    assert_response :success
  end

  test "should get setting_hostel_charges" do
    get :setting_hostel_charges
    assert_response :success
  end

  test "should get setting_mess_charges" do
    get :setting_mess_charges
    assert_response :success
  end

  test "should get classify_hostel" do
    get :classify_hostel
    assert_response :success
  end

  test "should get classify_hostel_room" do
    get :classify_hostel_room
    assert_response :success
  end

end
