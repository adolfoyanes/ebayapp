require 'test_helper'

class FrameColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @frame_color = frame_colors(:one)
  end

  test "should get index" do
    get frame_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_frame_color_url
    assert_response :success
  end

  test "should create frame_color" do
    assert_difference('FrameColor.count') do
      post frame_colors_url, params: { frame_color: { frame_width_id: @frame_color.frame_width_id, model_id: @frame_color.model_id, name: @frame_color.name } }
    end

    assert_redirected_to frame_color_url(FrameColor.last)
  end

  test "should show frame_color" do
    get frame_color_url(@frame_color)
    assert_response :success
  end

  test "should get edit" do
    get edit_frame_color_url(@frame_color)
    assert_response :success
  end

  test "should update frame_color" do
    patch frame_color_url(@frame_color), params: { frame_color: { frame_width_id: @frame_color.frame_width_id, model_id: @frame_color.model_id, name: @frame_color.name } }
    assert_redirected_to frame_color_url(@frame_color)
  end

  test "should destroy frame_color" do
    assert_difference('FrameColor.count', -1) do
      delete frame_color_url(@frame_color)
    end

    assert_redirected_to frame_colors_url
  end
end
