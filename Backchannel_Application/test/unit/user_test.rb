require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "should require all fields" do
    r = User.new
    assert !r.valid?
    r.username = "abc10"
    assert !r.valid?
    r.name = "abc10"
    assert !r.valid?
    r.password = "abc"
    assert r.valid?

  end
  test "should have all usernames unique" do
    r = User.new
    r.username="abc2"
    r.password="abc"
    assert !r.valid?
  end


end