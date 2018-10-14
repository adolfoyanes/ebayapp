require 'test_helper'

class EbayAuthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ebay_auth = ebay_auths(:one)
  end

  test "should get index" do
    get ebay_auths_url
    assert_response :success
  end

  test "should get new" do
    get new_ebay_auth_url
    assert_response :success
  end

  test "should create ebay_auth" do
    assert_difference('EbayAuth.count') do
      post ebay_auths_url, params: { ebay_auth: { access_token: @ebay_auth.access_token, expiration: @ebay_auth.expiration, refresh_token: @ebay_auth.refresh_token, token_type: @ebay_auth.token_type, user_id: @ebay_auth.user_id } }
    end

    assert_redirected_to ebay_auth_url(EbayAuth.last)
  end

  test "should show ebay_auth" do
    get ebay_auth_url(@ebay_auth)
    assert_response :success
  end

  test "should get edit" do
    get edit_ebay_auth_url(@ebay_auth)
    assert_response :success
  end

  test "should update ebay_auth" do
    patch ebay_auth_url(@ebay_auth), params: { ebay_auth: { access_token: @ebay_auth.access_token, expiration: @ebay_auth.expiration, refresh_token: @ebay_auth.refresh_token, token_type: @ebay_auth.token_type, user_id: @ebay_auth.user_id } }
    assert_redirected_to ebay_auth_url(@ebay_auth)
  end

  test "should destroy ebay_auth" do
    assert_difference('EbayAuth.count', -1) do
      delete ebay_auth_url(@ebay_auth)
    end

    assert_redirected_to ebay_auths_url
  end
end
