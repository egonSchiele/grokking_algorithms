require "minitest/autorun"
require "minitest/pride"
require "../lib/binary_search.rb"

class BinarySearchTest < MiniTest::Test
  LIST = [1, 2, 3, 4, 5]

  def test_position_is_returned
    element_position = BinarySearch.search(LIST, 3)

    assert_equal element_position, 2
  end

  def test_nothing_is_returned_when_item_does_not_exist
    element_position = BinarySearch.search(LIST, -2)

    assert_equal element_position, nil
  end
end
