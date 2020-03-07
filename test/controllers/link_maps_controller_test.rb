require 'test_helper'

class LinkMapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @link_map = link_maps(:one)
    @original_url = "https://www.google.com/"
  end

  test "should get index" do
    get link_maps_url
    assert_response :success
  end

  test "should get new" do
    get new_link_map_url
    assert_response :success
  end

  test "should create link_map" do
    assert_difference('LinkMap.count') do
      post link_maps_url, params: { link_map: { original_url: @original_url } }
    end

    assert_redirected_to link_map_url(LinkMap.last)
  end

  test "should show link_map" do
    get link_map_url(@link_map)
    assert_response :success
  end

  test "should get edit" do
    get edit_link_map_url(@link_map)
    assert_response :success
  end

  test "should update link_map" do
    patch link_map_url(@link_map), params: { link_map: { original_url: @link_map.original_url } }
    assert_redirected_to link_map_url(@link_map)
  end

  test "should destroy link_map" do
    assert_difference('LinkMap.count', -1) do
      delete link_map_url(@link_map)
    end

    assert_redirected_to link_maps_url
  end
end
