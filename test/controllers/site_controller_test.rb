require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get site_about_url
    assert_response :success
  end

  test "should get contact" do
    get site_contact_url
    assert_response :success
  end

end
