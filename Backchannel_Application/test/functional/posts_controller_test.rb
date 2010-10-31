require 'test_helper'

class PostsControllerTest <  ActionController::TestCase
#  test "should create post" do
#    assert_difference('Post.count') do
#      post :create, :post => { :content => "Post for test", :users => users(:two) }
#    end
#  end

#  test "should show post" do
#    get :show, :id => posts(:adminpost).to_param
#    assert_response :success
#  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id => posts(:one).to_param
    end
  end

end