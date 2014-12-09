require 'test_helper'

class MessageControllerTest < ActionController::TestCase
  test "should get new_message" do
    get :new_message
    assert_response :success
  end

end
