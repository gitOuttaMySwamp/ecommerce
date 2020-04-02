require "application_system_test_case"

class PiecesTest < ApplicationSystemTestCase
  setup do
    @piece = pieces(:one)
  end

  test "visiting the index" do
    visit pieces_url
    assert_selector "h1", text: "Pieces"
  end

  test "creating a Piece" do
    visit pieces_url
    click_on "New Piece"

    fill_in "Detailid", with: @piece.detailId
    fill_in "Dimensions", with: @piece.dimensions
    fill_in "Image", with: @piece.image
    fill_in "Name", with: @piece.name
    fill_in "Price", with: @piece.price
    fill_in "Sizeid", with: @piece.sizeId
    click_on "Create Piece"

    assert_text "Piece was successfully created"
    click_on "Back"
  end

  test "updating a Piece" do
    visit pieces_url
    click_on "Edit", match: :first

    fill_in "Detailid", with: @piece.detailId
    fill_in "Dimensions", with: @piece.dimensions
    fill_in "Image", with: @piece.image
    fill_in "Name", with: @piece.name
    fill_in "Price", with: @piece.price
    fill_in "Sizeid", with: @piece.sizeId
    click_on "Update Piece"

    assert_text "Piece was successfully updated"
    click_on "Back"
  end

  test "destroying a Piece" do
    visit pieces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Piece was successfully destroyed"
  end
end
