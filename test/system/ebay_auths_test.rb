require "application_system_test_case"

class EbayAuthsTest < ApplicationSystemTestCase
  setup do
    @ebay_auth = ebay_auths(:one)
  end

  test "visiting the index" do
    visit ebay_auths_url
    assert_selector "h1", text: "Ebay Auths"
  end

  test "creating a Ebay auth" do
    visit ebay_auths_url
    click_on "New Ebay Auth"

    fill_in "Access Token", with: @ebay_auth.access_token
    fill_in "Expiration", with: @ebay_auth.expiration
    fill_in "Refresh Token", with: @ebay_auth.refresh_token
    fill_in "Token Type", with: @ebay_auth.token_type
    fill_in "User", with: @ebay_auth.user_id
    click_on "Create Ebay auth"

    assert_text "Ebay auth was successfully created"
    click_on "Back"
  end

  test "updating a Ebay auth" do
    visit ebay_auths_url
    click_on "Edit", match: :first

    fill_in "Access Token", with: @ebay_auth.access_token
    fill_in "Expiration", with: @ebay_auth.expiration
    fill_in "Refresh Token", with: @ebay_auth.refresh_token
    fill_in "Token Type", with: @ebay_auth.token_type
    fill_in "User", with: @ebay_auth.user_id
    click_on "Update Ebay auth"

    assert_text "Ebay auth was successfully updated"
    click_on "Back"
  end

  test "destroying a Ebay auth" do
    visit ebay_auths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ebay auth was successfully destroyed"
  end
end
