require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get step1" do
    get checkout_step1_url
    assert_response :success
  end

  test "should get step2" do
    get checkout_step2_url
    assert_response :success
  end

  test "should get step3" do
    get checkout_step3_url
    assert_response :success
  end

  test "should get step4" do
    get checkout_step4_url
    assert_response :success
  end

end
