require 'test_helper'

class FrameWidthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @frame_width = frame_widths(:one)
  end

  test "should get index" do
    get frame_widths_url
    assert_response :success
  end

  test "should get new" do
    get new_frame_width_url
    assert_response :success
  end

  test "should create frame_width" do
    assert_difference('FrameWidth.count') do
      post frame_widths_url, params: { frame_width: { name: @frame_width.name } }
    end

    assert_redirected_to frame_width_url(FrameWidth.last)
  end

  test "should show frame_width" do
    get frame_width_url(@frame_width)
    assert_response :success
  end

  test "should get edit" do
    get edit_frame_width_url(@frame_width)
    assert_response :success
  end

  test "should update frame_width" do
    patch frame_width_url(@frame_width), params: { frame_width: { name: @frame_width.name } }
    assert_redirected_to frame_width_url(@frame_width)
  end

  test "should destroy frame_width" do
    assert_difference('FrameWidth.count', -1) do
      delete frame_width_url(@frame_width)
    end

    assert_redirected_to frame_widths_url
  end
end
