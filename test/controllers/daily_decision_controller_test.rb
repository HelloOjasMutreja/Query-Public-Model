require "test_helper"

class DailyDecisionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get daily_decision_create_url
    assert_response :success
  end

  test "should get update" do
    get daily_decision_update_url
    assert_response :success
  end

  test "should get index" do
    get daily_decision_index_url
    assert_response :success
  end

  test "should get show" do
    get daily_decision_show_url
    assert_response :success
  end
end
