require 'test_helper'

class LensColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lens_color = lens_colors(:one)
  end

  test "should get index" do
    get lens_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_lens_color_url
    assert_response :success
  end

  test "should create lens_color" do
    assert_difference('LensColor.count') do
      post lens_colors_url, params: { lens_color: { frame_color_id: @lens_color.frame_color_id, frame_width_id: @lens_color.frame_width_id, model_id: @lens_color.model_id, name: @lens_color.name } }
    end

    assert_redirected_to lens_color_url(LensColor.last)
  end

  test "should show lens_color" do
    get lens_color_url(@lens_color)
    assert_response :success
  end

  test "should get edit" do
    get edit_lens_color_url(@lens_color)
    assert_response :success
  end

  test "should update lens_color" do
    patch lens_color_url(@lens_color), params: { lens_color: { frame_color_id: @lens_color.frame_color_id, frame_width_id: @lens_color.frame_width_id, model_id: @lens_color.model_id, name: @lens_color.name } }
    assert_redirected_to lens_color_url(@lens_color)
  end

  test "should destroy lens_color" do
    assert_difference('LensColor.count', -1) do
      delete lens_color_url(@lens_color)
    end

    assert_redirected_to lens_colors_url
  end
end
