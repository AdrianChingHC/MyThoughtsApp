require 'test_helper'

class ThoughtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:admin)
    @thought = @user.thoughts.build(content: "This is a thought")
  end

  test "should be valid" do
    assert @thought.valid?
  end

  test "user id should be present" do
    @thought.user_id = nil
    assert_not @thought.valid?
  end

  test "content should be present " do
    @thought.content = "   "
    assert_not @thought.valid?
  end

  test "content should not be longer than 250 characters" do
  	@thought.content = "a" * 251
  	assert_not @thought.valid?
  end
end
