require 'test_helper'

class LinkMapTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "shorten url" do
    a = link_maps(:one)

    assert a.short_data.present?
  end
end
