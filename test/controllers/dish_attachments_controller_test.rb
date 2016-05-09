require 'test_helper'

class DishAttachmentsControllerTest < ActionController::TestCase
  setup do
    @dish_attachment = dish_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dish_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dish_attachment" do
    assert_difference('DishAttachment.count') do
      post :create, dish_attachment: { dish_id: @dish_attachment.dish_id, image: @dish_attachment.image }
    end

    assert_redirected_to dish_attachment_path(assigns(:dish_attachment))
  end

  test "should show dish_attachment" do
    get :show, id: @dish_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dish_attachment
    assert_response :success
  end

  test "should update dish_attachment" do
    patch :update, id: @dish_attachment, dish_attachment: { dish_id: @dish_attachment.dish_id, image: @dish_attachment.image }
    assert_redirected_to dish_attachment_path(assigns(:dish_attachment))
  end

  test "should destroy dish_attachment" do
    assert_difference('DishAttachment.count', -1) do
      delete :destroy, id: @dish_attachment
    end

    assert_redirected_to dish_attachments_path
  end
end
