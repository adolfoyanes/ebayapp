require 'test_helper'

class LensMaterialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lens_material = lens_materials(:one)
  end

  test "should get index" do
    get lens_materials_url
    assert_response :success
  end

  test "should get new" do
    get new_lens_material_url
    assert_response :success
  end

  test "should create lens_material" do
    assert_difference('LensMaterial.count') do
      post lens_materials_url, params: { lens_material: { frame_color_id: @lens_material.frame_color_id, frame_width_id: @lens_material.frame_width_id, lens_color_id: @lens_material.lens_color_id, model_id: @lens_material.model_id, name: @lens_material.name } }
    end

    assert_redirected_to lens_material_url(LensMaterial.last)
  end

  test "should show lens_material" do
    get lens_material_url(@lens_material)
    assert_response :success
  end

  test "should get edit" do
    get edit_lens_material_url(@lens_material)
    assert_response :success
  end

  test "should update lens_material" do
    patch lens_material_url(@lens_material), params: { lens_material: { frame_color_id: @lens_material.frame_color_id, frame_width_id: @lens_material.frame_width_id, lens_color_id: @lens_material.lens_color_id, model_id: @lens_material.model_id, name: @lens_material.name } }
    assert_redirected_to lens_material_url(@lens_material)
  end

  test "should destroy lens_material" do
    assert_difference('LensMaterial.count', -1) do
      delete lens_material_url(@lens_material)
    end

    assert_redirected_to lens_materials_url
  end
end
