require 'test_helper'

class Api::AgendaControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_agenda_all_url
    assert_response :success
  end

end
