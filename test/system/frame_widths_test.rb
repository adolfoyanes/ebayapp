require "application_system_test_case"

class FrameWidthsTest < ApplicationSystemTestCase
  setup do
    @frame_width = frame_widths(:one)
  end

  test "visiting the index" do
    visit frame_widths_url
    assert_selector "h1", text: "Frame Widths"
  end

  test "creating a Frame width" do
    visit frame_widths_url
    click_on "New Frame Width"

    fill_in "Name", with: @frame_width.name
    click_on "Create Frame width"

    assert_text "Frame width was successfully created"
    click_on "Back"
  end

  test "updating a Frame width" do
    visit frame_widths_url
    click_on "Edit", match: :first

    fill_in "Name", with: @frame_width.name
    click_on "Update Frame width"

    assert_text "Frame width was successfully updated"
    click_on "Back"
  end

  test "destroying a Frame width" do
    visit frame_widths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Frame width was successfully destroyed"
  end
end
