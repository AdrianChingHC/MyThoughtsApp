require 'test_helper'

class ThoughtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:admin)
    @thought = Thought.new(content: "This is a thought", user_id: @user.id)
  end

  test "should be valid" do
    assert @thought.valid?
  end

  test "user id should be present" do
    @thought.user_id = nil
    assert_not @thought.valid?
  end
end
