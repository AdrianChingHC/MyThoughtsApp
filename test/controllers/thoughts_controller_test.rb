require 'test_helper'

class ThoughtsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @thought = thoughts(:first)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'thoughts.count' do
      post :create, thought: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'thoughts.count' do
      delete :destroy, id: @thought
    end
    assert_redirected_to login_url
  end
end
