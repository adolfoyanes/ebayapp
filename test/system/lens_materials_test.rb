require "application_system_test_case"

class LensMaterialsTest < ApplicationSystemTestCase
  setup do
    @lens_material = lens_materials(:one)
  end

  test "visiting the index" do
    visit lens_materials_url
    assert_selector "h1", text: "Lens Materials"
  end

  test "creating a Lens material" do
    visit lens_materials_url
    click_on "New Lens Material"

    fill_in "Frame Color", with: @lens_material.frame_color_id
    fill_in "Frame Width", with: @lens_material.frame_width_id
    fill_in "Lens Color", with: @lens_material.lens_color_id
    fill_in "Model", with: @lens_material.model_id
    fill_in "Name", with: @lens_material.name
    click_on "Create Lens material"

    assert_text "Lens material was successfully created"
    click_on "Back"
  end

  test "updating a Lens material" do
    visit lens_materials_url
    click_on "Edit", match: :first

    fill_in "Frame Color", with: @lens_material.frame_color_id
    fill_in "Frame Width", with: @lens_material.frame_width_id
    fill_in "Lens Color", with: @lens_material.lens_color_id
    fill_in "Model", with: @lens_material.model_id
    fill_in "Name", with: @lens_material.name
    click_on "Update Lens material"

    assert_text "Lens material was successfully updated"
    click_on "Back"
  end

  test "destroying a Lens material" do
    visit lens_materials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lens material was successfully destroyed"
  end
end
