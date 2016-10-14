require 'test_helper'

class Sale::NotesControllerTest < ActionController::TestCase
  setup do
    @sale_note = sale_notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sale_notes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale_note" do
    assert_difference('Sale::Note.count') do
      post :create, sale_note: {  }
    end

    assert_redirected_to sale_note_path(assigns(:sale_note))
  end

  test "should show sale_note" do
    get :show, id: @sale_note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale_note
    assert_response :success
  end

  test "should update sale_note" do
    patch :update, id: @sale_note, sale_note: {  }
    assert_redirected_to sale_note_path(assigns(:sale_note))
  end

  test "should destroy sale_note" do
    assert_difference('Sale::Note.count', -1) do
      delete :destroy, id: @sale_note
    end

    assert_redirected_to sale_notes_path
  end
end
