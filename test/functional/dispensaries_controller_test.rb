require 'test_helper'

class DispensariesControllerTest < ActionController::TestCase

  test "list dispensaries" do
    get :index
    assert_response :success
    assert_template :index
    assert_select 'h2', 'Dispensaries'
  end
  
  test "new dispensary" do
    get :new
    assert_response :success
    assert_template :new
    assert_select 'form#new_dispensary'
  end
  
  test "creating a dispensary" do
    post :create, :dispensary => { :name   => 'New Dispensary',
                                   :street => '123 Main St.',
                                   :city   => 'Hollywood',
                                   :state  => 'CA',
                                   :zip    => '12345'}
    assert_response :redirect
    assert_equal "Dispensary successfully created", flash[:success]
  end
end
