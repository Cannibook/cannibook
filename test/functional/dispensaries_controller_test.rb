require 'test_helper'

class DispensariesControllerTest < ActionController::TestCase

  test "list dispensaries" do
    get :index
    assert_response :success
    assert_template :index
    assert_select 'h1', 'Dispensaries'
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
  
  test "creating an invalid dispensary" do
    post :create, :dispensary => { }
    assert_template :new
  end
  
  test "updating a dispensary" do
    post :update, { 'id' => dispensaries(:valid_club_for_updating).id,
                    :dispensary => { :name => 'New Club Name',
                                     :street => '123 Main St.',
                                     :city   => 'Hollywood',
                                     :state  => 'CA',
                                     :zip    => '12345'} }
    assert_not_nil assigns(:dispensary)
    assert_response :redirect
    assert_equal "New Club Name successfully updated", flash[:success]
  end
  
  test "updating a dispensary with invalid params" do
    post :update, { :id => dispensaries(:valid_club_for_updating).id, 
                    :dispensary => { :name => nil }}
    assert_template :edit
  end
  
  test "deleting a dispensary" do
    delete :destroy, { 'id' => dispensaries(:valid_club_for_updating).id }
    assert_response :redirect
    assert_equal "#{dispensaries(:valid_club_for_updating).name} successfully deleted", flash[:success]
  end
  
  test "autocomplete callback" do
    get :list, { :term => 'G' }
    # hrmm... how to test rendered json?
  end
  
  test "gmaps on show" do
    get :show, { 'id' => dispensaries(:valid_existing_club).id }
    assert_not_nil assigns(:map)
  end
end
