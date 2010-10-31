require 'test_helper'

class UITest < ActionController::IntegrationTest
  fixtures :all

  test "Sign up new user" do     
     visit "/users/new"
     fill_in "user[name]", :with => "Test"
     fill_in "user[username]", :with => "Test"
     fill_in "user[password]", :with => "abc"
     fill_in "user[password_confirmation]", :with => "abc"          
     click_button "user_submit"
     assert_contain "New to Woofer"
  end

  test "search user" do
     User.create!(:username => "Test", :password => "abc", :admin => false, :name => "Test LA")
     visit "/users/search/1"
     fill_in "username", :with => "Test"
     click_button "Search"
     assert_contain "Test"
  end

  test "search non existing user" do
     User.create!(:username => "Test1", :password => "abc", :admin => false, :name => "Test LA")
     visit "/users/search/1"
     fill_in "username", :with => "Test"
     click_button "Search"
     assert_contain "No Match"
  end

  test "link to signup from first page" do
     visit "/users/signin/1"
     click_link "Sign Up"
     assert_contain "NAME"
  end  
  
end
