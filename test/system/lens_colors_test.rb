require "application_system_test_case"

class LensColorsTest < ApplicationSystemTestCase
  setup do
    @lens_color = lens_colors(:one)
  end

  test "visiting the index" do
    visit lens_colors_url
    assert_selector "h1", text: "Lens Colors"
  end

  test "creating a Lens color" do
    visit lens_colors_url
    click_on "New Lens Color"

    fill_in "Frame Color", with: @lens_color.frame_color_id
    fill_in "Frame Width", with: @lens_color.frame_width_id
    fill_in "Model", with: @lens_color.model_id
    fill_in "Name", with: @lens_color.name
    click_on "Create Lens color"

    assert_text "Lens color was successfully created"
    click_on "Back"
  end

  test "updating a Lens color" do
    visit lens_colors_url
    click_on "Edit", match: :first

    fill_in "Frame Color", with: @lens_color.frame_color_id
    fill_in "Frame Width", with: @lens_color.frame_width_id
    fill_in "Model", with: @lens_color.model_id
    fill_in "Name", with: @lens_color.name
    click_on "Update Lens color"

    assert_text "Lens color was successfully updated"
    click_on "Back"
  end

  test "destroying a Lens color" do
    visit lens_colors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lens color was successfully destroyed"
  end
end
