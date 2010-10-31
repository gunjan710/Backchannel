require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  test "should require all fields" do
    r = Post.new
    assert !r.valid?
    r.content = "abc"
    assert !r.valid?
    r.users_id = 1
    assert r.valid?
  end
end

