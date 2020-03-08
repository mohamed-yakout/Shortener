require 'test_helper'

class LinkMapTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "shorten url" do
    link_map = link_maps(:one)

    assert link_map.short_data.present?
  end

  test "create original url" do
    link_map = LinkMap.create(original_url: "https://www.google.com/")

    assert link_map.short_data.present?
  end
end
