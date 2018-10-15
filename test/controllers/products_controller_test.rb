require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { average_price: @product.average_price, average_sold: @product.average_sold, cost: @product.cost, current_price: @product.current_price, gross_margin: @product.gross_margin, name: @product.name, net_margin: @product.net_margin, roi: @product.roi, total_sold: @product.total_sold, upc: @product.upc, url: @product.url } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { average_price: @product.average_price, average_sold: @product.average_sold, cost: @product.cost, current_price: @product.current_price, gross_margin: @product.gross_margin, name: @product.name, net_margin: @product.net_margin, roi: @product.roi, total_sold: @product.total_sold, upc: @product.upc, url: @product.url } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
