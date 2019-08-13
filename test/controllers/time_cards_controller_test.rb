require 'test_helper'

class TimeCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get time_cards_home_url
    assert_response :success
  end

  test "should get index" do
    get time_cards_index_url
    assert_response :success
  end

end
