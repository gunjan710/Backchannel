require 'test_helper'

class CheerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  test "should require all fields" do
    r = Cheer.new
    assert !r.valid?
    r.posts_id = 1
    assert !r.valid?
    r.users_id = 1
    assert r.valid?
  end
end