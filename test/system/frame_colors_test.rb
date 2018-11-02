require "application_system_test_case"

class FrameColorsTest < ApplicationSystemTestCase
  setup do
    @frame_color = frame_colors(:one)
  end

  test "visiting the index" do
    visit frame_colors_url
    assert_selector "h1", text: "Frame Colors"
  end

  test "creating a Frame color" do
    visit frame_colors_url
    click_on "New Frame Color"

    fill_in "Frame Width", with: @frame_color.frame_width_id
    fill_in "Model", with: @frame_color.model_id
    fill_in "Name", with: @frame_color.name
    click_on "Create Frame color"

    assert_text "Frame color was successfully created"
    click_on "Back"
  end

  test "updating a Frame color" do
    visit frame_colors_url
    click_on "Edit", match: :first

    fill_in "Frame Width", with: @frame_color.frame_width_id
    fill_in "Model", with: @frame_color.model_id
    fill_in "Name", with: @frame_color.name
    click_on "Update Frame color"

    assert_text "Frame color was successfully updated"
    click_on "Back"
  end

  test "destroying a Frame color" do
    visit frame_colors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Frame color was successfully destroyed"
  end
end
