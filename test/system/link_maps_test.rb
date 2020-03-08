require "application_system_test_case"

class LinkMapsTest < ApplicationSystemTestCase
  setup do
    @link_map_one = link_maps(:one)
    @link_map_two = link_maps(:two)
    LinkMap.create(original_url: "https://www.google.com/")
    LinkMap.create(original_url: "https://www.linkedin.com/")
    @original_url = "https://www.youtube.com/"
    @new_original_url = "https://www.stackoverflow.com/"

    Capybara.default_max_wait_time = 5
  end

  test "visiting the index" do
    visit link_maps_url
    assert_selector "h1", text: "Link Maps"
  end

  test "creating a LinkMap" do
    visit link_maps_url
    click_on "New Link Map"

    fill_in "Original url", with: @original_url
    click_on "Create Link map"

    assert_text "Link map was successfully created"
    click_on "Back"
  end

  test "updating a LinkMap" do
    # visit link_maps_url
    visit link_map_url(@link_map_one)
    click_on "Edit", match: :first


    fill_in "Original url", with: @new_original_url
    click_on "Update Link map"
    # page.accept_confirm do
    #   click_on "Update Link map"
    # end

    assert_text "Link map was successfully updated"
    click_on "Back"
  end

  test "destroying a LinkMap" do
    visit link_maps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Link map was successfully destroyed"
  end
end
