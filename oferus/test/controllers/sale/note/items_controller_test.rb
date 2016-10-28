require 'test_helper'

class Sale::Note::ItemsControllerTest < ActionController::TestCase
  setup do
    @sale_note_item = sale_note_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sale_note_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale_note_item" do
    assert_difference('Sale::Note::Item.count') do
      post :create, sale_note_item: {  }
    end

    assert_redirected_to sale_note_item_path(assigns(:sale_note_item))
  end

  test "should show sale_note_item" do
    get :show, id: @sale_note_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale_note_item
    assert_response :success
  end

  test "should update sale_note_item" do
    patch :update, id: @sale_note_item, sale_note_item: {  }
    assert_redirected_to sale_note_item_path(assigns(:sale_note_item))
  end

  test "should destroy sale_note_item" do
    assert_difference('Sale::Note::Item.count', -1) do
      delete :destroy, id: @sale_note_item
    end

    assert_redirected_to sale_note_items_path
  end
end
