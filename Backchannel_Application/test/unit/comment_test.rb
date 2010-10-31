require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  test "should require all fields" do
    r = Comment.new
    assert !r.valid?
    r.original_post = 1
    assert !r.valid?
    r.reply = 2
    assert r.valid?
  end
end

