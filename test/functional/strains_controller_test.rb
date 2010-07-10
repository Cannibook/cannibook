require 'test_helper'

class StrainsControllerTest < ActionController::TestCase

  test "list strains" do
    get :index
    assert_response :success
    assert_template :index
    assert_select 'h1', 'Strains'
  end
  
  test "new strain" do
    get :new
    assert_response :success
    assert_template :new
    assert_select 'form#new_strain'
  end
  
  test "creating a strain" do
    post :create, :strain => { :name   => 'Big Bud' }
    assert_response :redirect
    assert_equal "Strain successfully created", flash[:success]
  end
  
  test "creating an invalid strain" do
    post :create, :strain => { }
    assert_template :new
  end
  
  test "editing a strain" do
    get :edit, { 'id' => strains(:valid_strain_for_update).id }
    assert_response :success
    assert_template :edit
    assert_select 'h1', "Edit #{strains(:valid_strain_for_update).name}"
  end
  
  test "updating a strain" do
    post :update, { 'id' => strains(:valid_strain_for_update).id,
                    :strain => { 'name' => 'Hindu Kush' } }
    assert_not_nil assigns(:strain)
    assert_response :redirect
    assert_equal "Hindu Kush successfully updated", flash[:success]
  end
  
  test "updating a strain with invalid params" do
    post :update, { 'id' => strains(:valid_strain_for_update).id,
                    :strain => { 'name' => nil } }
    assert_template :edit
  end
  
  test "deleting a strain" do
    delete :destroy, { 'id' => strains(:strain_for_delete).id }
    assert_response :redirect
    assert_equal "Hydro successfully deleted", flash[:success]
  end
end
