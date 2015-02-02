require 'test_helper'

class ThoughtIndexTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:admin)
  end

  test 'thoughts display' do
  	log_in_as(@user)
  	get thoughts_path
  	assert_match @user.thoughts.count.to_s, response.body
    assert_select 'div.pagination'
    @user.thoughts.paginate(page: 1).each do |thought|
      assert_match thought.content, response.body
    end
  end
end
