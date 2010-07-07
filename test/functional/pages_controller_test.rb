require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  # quick testing of the title_for_layout helper
  test "page title without setting title variable" do
    get :index
    assert_select 'title', 'Cannibook'
  end
  
  test "page title with title variable set" do
    get :about
    assert_select 'title', 'About &ndash; Cannibook'
  end
  
  test "get index page" do
    get :index
    assert_response :success
  end
  
  test "get about page" do
    get :about
    assert_response :success
  end
end
