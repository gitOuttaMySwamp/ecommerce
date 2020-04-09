require 'test_helper'

class SalesTaxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_tax = sales_taxes(:one)
  end

  test "should get index" do
    get sales_taxes_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_tax_url
    assert_response :success
  end

  test "should create sales_tax" do
    assert_difference('SalesTax.count') do
      post sales_taxes_url, params: { sales_tax: {  } }
    end

    assert_redirected_to sales_tax_url(SalesTax.last)
  end

  test "should show sales_tax" do
    get sales_tax_url(@sales_tax)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_tax_url(@sales_tax)
    assert_response :success
  end

  test "should update sales_tax" do
    patch sales_tax_url(@sales_tax), params: { sales_tax: {  } }
    assert_redirected_to sales_tax_url(@sales_tax)
  end

  test "should destroy sales_tax" do
    assert_difference('SalesTax.count', -1) do
      delete sales_tax_url(@sales_tax)
    end

    assert_redirected_to sales_taxes_url
  end
end
