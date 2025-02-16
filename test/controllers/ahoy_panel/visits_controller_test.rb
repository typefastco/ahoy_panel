require "test_helper"

module AhoyPanel
  class VisitsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "the truth" do
      get visits_path
      assert_response :success
    end
  end
end
