require "application_system_test_case"

class SalesTaxesTest < ApplicationSystemTestCase
  setup do
    @sales_tax = sales_taxes(:one)
  end

  test "visiting the index" do
    visit sales_taxes_url
    assert_selector "h1", text: "Sales Taxes"
  end

  test "creating a Sales tax" do
    visit sales_taxes_url
    click_on "New Sales Tax"

    click_on "Create Sales tax"

    assert_text "Sales tax was successfully created"
    click_on "Back"
  end

  test "updating a Sales tax" do
    visit sales_taxes_url
    click_on "Edit", match: :first

    click_on "Update Sales tax"

    assert_text "Sales tax was successfully updated"
    click_on "Back"
  end

  test "destroying a Sales tax" do
    visit sales_taxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sales tax was successfully destroyed"
  end
end
